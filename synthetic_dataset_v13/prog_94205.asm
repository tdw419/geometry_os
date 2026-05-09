; DESCRIPTION: Places a blue line segment connecting (211, 18) to (107, 135).
; PLAN: r0=211(x1), r1=18(y1), r2=107(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 18
LDI r2, 107
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
