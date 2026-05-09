; DESCRIPTION: Places a blue line segment connecting (107, 135) to (498, 4).
; PLAN: r0=107(x1), r1=135(y1), r2=498(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 135
LDI r2, 498
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
