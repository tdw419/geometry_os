; DESCRIPTION: Composite: Creates a cyan circular shape at (384, 40) with radius 18 then Creates a magenta rectangular region at (204, 172) spanning 117 by 39 pixels then Places a orange dot at position (45, 8).
; PLAN: r0=384(x), r1=40(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=172(y), r7=117(width), r8=39(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=45(x), r11=8(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 40
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 172
LDI r7, 117
LDI r8, 39
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 8
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
