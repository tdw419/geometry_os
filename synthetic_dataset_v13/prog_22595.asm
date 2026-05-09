; DESCRIPTION: Places a purple line segment connecting (402, 63) to (346, 178).
; PLAN: r0=402(x1), r1=63(y1), r2=346(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 63
LDI r2, 346
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
