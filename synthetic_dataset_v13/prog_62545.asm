; DESCRIPTION: Places a purple line segment connecting (150, 193) to (442, 24).
; PLAN: r0=150(x1), r1=193(y1), r2=442(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 193
LDI r2, 442
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
