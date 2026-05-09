; DESCRIPTION: Places a purple line segment connecting (319, 120) to (350, 220).
; PLAN: r0=319(x1), r1=120(y1), r2=350(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 120
LDI r2, 350
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
