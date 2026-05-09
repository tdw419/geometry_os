; DESCRIPTION: Composite: Renders a purple disk with center (351, 209) and radius 14 then Renders a magenta line between points (257, 2) and (69, 155) then Creates a magenta rectangular region at (436, 110) spanning 72 by 76 pixels.
; PLAN: r0=351(x), r1=209(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x1), r6=2(y1), r7=69(x2), r8=155(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=110(y), r12=72(width), r13=76(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 209
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 2
LDI r7, 69
LDI r8, 155
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 110
LDI r12, 72
LDI r13, 76
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
