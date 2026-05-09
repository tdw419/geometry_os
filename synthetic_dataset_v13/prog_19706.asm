; DESCRIPTION: Places a purple line segment connecting (370, 63) to (215, 172).
; PLAN: r0=370(x1), r1=63(y1), r2=215(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 63
LDI r2, 215
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
