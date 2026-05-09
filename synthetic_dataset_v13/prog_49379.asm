; DESCRIPTION: Draws a blue line from (111, 137) to (505, 2).
; PLAN: r0=111(x1), r1=137(y1), r2=505(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 137
LDI r2, 505
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
