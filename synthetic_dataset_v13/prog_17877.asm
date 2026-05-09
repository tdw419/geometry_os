; DESCRIPTION: Composite: Draws a orange rectangle at (167, 23) with width 80 and height 86 then Creates a green circular shape at (354, 149) with radius 42.
; PLAN: r0=167(x), r1=23(y), r2=80(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=149(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 167
LDI r1, 23
LDI r2, 80
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 149
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
