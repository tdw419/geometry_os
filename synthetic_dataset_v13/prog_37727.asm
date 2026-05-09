; DESCRIPTION: Places a purple line segment connecting (32, 126) to (325, 208).
; PLAN: r0=32(x1), r1=126(y1), r2=325(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 126
LDI r2, 325
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
