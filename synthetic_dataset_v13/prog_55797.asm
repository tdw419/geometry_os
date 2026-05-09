; DESCRIPTION: Composite: Creates a orange circular shape at (431, 129) with radius 37 then Creates a black rectangular region at (147, 214) spanning 86 by 26 pixels.
; PLAN: r0=431(x), r1=129(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=214(y), r7=86(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 129
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 214
LDI r7, 86
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
