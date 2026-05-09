; DESCRIPTION: Places a blue line segment connecting (139, 130) to (36, 128).
; PLAN: r0=139(x1), r1=130(y1), r2=36(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 130
LDI r2, 36
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
