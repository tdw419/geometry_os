; DESCRIPTION: Places a purple line segment connecting (442, 53) to (417, 113).
; PLAN: r0=442(x1), r1=53(y1), r2=417(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 53
LDI r2, 417
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
