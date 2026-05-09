; DESCRIPTION: Draws a blue line from (16, 110) to (461, 25).
; PLAN: r0=16(x1), r1=110(y1), r2=461(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 110
LDI r2, 461
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
