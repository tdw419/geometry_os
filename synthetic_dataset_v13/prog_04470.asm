; DESCRIPTION: Draws a purple line from (470, 183) to (94, 224).
; PLAN: r0=470(x1), r1=183(y1), r2=94(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 183
LDI r2, 94
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
