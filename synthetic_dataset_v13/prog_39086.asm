; DESCRIPTION: Draws a cyan line from (511, 207) to (80, 119).
; PLAN: r0=511(x1), r1=207(y1), r2=80(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 207
LDI r2, 80
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
