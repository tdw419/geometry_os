; DESCRIPTION: Draws a yellow line from (237, 130) to (325, 122).
; PLAN: r0=237(x1), r1=130(y1), r2=325(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 130
LDI r2, 325
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
