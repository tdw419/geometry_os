; DESCRIPTION: Draws a cyan line from (250, 181) to (11, 75).
; PLAN: r0=250(x1), r1=181(y1), r2=11(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 181
LDI r2, 11
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
