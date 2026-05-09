; DESCRIPTION: Places a blue line segment connecting (230, 64) to (260, 110).
; PLAN: r0=230(x1), r1=64(y1), r2=260(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 64
LDI r2, 260
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
