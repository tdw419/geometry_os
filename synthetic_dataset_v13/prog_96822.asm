; DESCRIPTION: Draws a yellow line from (224, 136) to (264, 72).
; PLAN: r0=224(x1), r1=136(y1), r2=264(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 136
LDI r2, 264
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
