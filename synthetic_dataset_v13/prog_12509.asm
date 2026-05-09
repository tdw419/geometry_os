; DESCRIPTION: Places a purple line segment connecting (103, 237) to (145, 220).
; PLAN: r0=103(x1), r1=237(y1), r2=145(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 237
LDI r2, 145
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
