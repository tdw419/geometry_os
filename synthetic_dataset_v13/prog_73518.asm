; DESCRIPTION: Places a blue line segment connecting (496, 180) to (126, 224).
; PLAN: r0=496(x1), r1=180(y1), r2=126(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 180
LDI r2, 126
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
