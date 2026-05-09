; DESCRIPTION: Composite: Sets a single magenta pixel at (224, 244) then Draws a yellow line from (447, 191) to (207, 148) then Draws a blue circle centered at (107, 177) with radius 58.
; PLAN: r0=224(x), r1=244(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=447(x1), r6=191(y1), r7=207(x2), r8=148(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=177(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 224
LDI r1, 244
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 447
LDI r6, 191
LDI r7, 207
LDI r8, 148
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 177
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
