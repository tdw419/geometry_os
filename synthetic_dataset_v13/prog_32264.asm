; DESCRIPTION: Draws a purple line from (144, 130) to (71, 234).
; PLAN: r0=144(x1), r1=130(y1), r2=71(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 130
LDI r2, 71
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
