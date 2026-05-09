; DESCRIPTION: Places a purple line segment connecting (509, 150) to (192, 164).
; PLAN: r0=509(x1), r1=150(y1), r2=192(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 150
LDI r2, 192
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
