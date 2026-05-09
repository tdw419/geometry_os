; DESCRIPTION: Draws a blue line from (105, 153) to (64, 4).
; PLAN: r0=105(x1), r1=153(y1), r2=64(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 153
LDI r2, 64
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
