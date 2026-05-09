; DESCRIPTION: Composite: Creates a yellow circular shape at (225, 129) with radius 18 then Creates a orange rectangular region at (347, 83) spanning 109 by 63 pixels then Places a magenta line segment connecting (426, 63) to (264, 228).
; PLAN: r0=225(x), r1=129(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=83(y), r7=109(width), r8=63(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x1), r11=63(y1), r12=264(x2), r13=228(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 129
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 83
LDI r7, 109
LDI r8, 63
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 63
LDI r12, 264
LDI r13, 228
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
