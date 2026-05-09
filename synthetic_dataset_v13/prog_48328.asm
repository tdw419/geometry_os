; DESCRIPTION: Places a magenta line segment connecting (374, 130) to (147, 191).
; PLAN: r0=374(x1), r1=130(y1), r2=147(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 130
LDI r2, 147
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
