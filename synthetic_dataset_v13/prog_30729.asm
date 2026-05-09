; DESCRIPTION: Composite: Sets a single red pixel at (246, 192) then Creates a orange rectangular region at (217, 154) spanning 94 by 38 pixels then Creates a blue circular shape at (371, 181) with radius 74.
; PLAN: r0=246(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=154(y), r7=94(width), r8=38(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=181(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 217
LDI r6, 154
LDI r7, 94
LDI r8, 38
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 181
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
