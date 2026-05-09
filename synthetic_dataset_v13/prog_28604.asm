; DESCRIPTION: Composite: Creates a green circular shape at (192, 155) with radius 54 then Creates a orange rectangular region at (57, 26) spanning 98 by 23 pixels.
; PLAN: r0=192(x), r1=155(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=26(y), r7=98(width), r8=23(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 155
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 26
LDI r7, 98
LDI r8, 23
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
