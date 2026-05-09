; DESCRIPTION: Composite: Places a orange line segment connecting (274, 255) to (399, 215) then Places a black dot at position (147, 150) then Creates a white rectangular region at (374, 130) spanning 120 by 88 pixels.
; PLAN: r0=274(x1), r1=255(y1), r2=399(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=150(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=374(x), r11=130(y), r12=120(width), r13=88(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 255
LDI r2, 399
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 150
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 374
LDI r11, 130
LDI r12, 120
LDI r13, 88
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
