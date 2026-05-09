; DESCRIPTION: Draws a cyan line from (244, 4) to (174, 119).
; PLAN: r0=244(x1), r1=4(y1), r2=174(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 4
LDI r2, 174
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
