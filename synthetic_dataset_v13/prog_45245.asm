; DESCRIPTION: Places a purple line segment connecting (350, 27) to (336, 98).
; PLAN: r0=350(x1), r1=27(y1), r2=336(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 27
LDI r2, 336
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
