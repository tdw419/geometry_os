; DESCRIPTION: Draws a yellow line from (37, 222) to (400, 224).
; PLAN: r0=37(x1), r1=222(y1), r2=400(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 222
LDI r2, 400
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
