; DESCRIPTION: Composite: Places a yellow line segment connecting (171, 198) to (9, 134) then Sets a single yellow pixel at (224, 219) then Creates a blue rectangular region at (265, 112) spanning 50 by 14 pixels.
; PLAN: r0=171(x1), r1=198(y1), r2=9(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=219(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=265(x), r11=112(y), r12=50(width), r13=14(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 198
LDI r2, 9
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 219
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 265
LDI r11, 112
LDI r12, 50
LDI r13, 14
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
