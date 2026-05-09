; DESCRIPTION: Composite: Places a orange dot at position (190, 239) then Creates a cyan circular shape at (120, 185) with radius 61 then Draws a white rectangle at (329, 8) with width 91 and height 63.
; PLAN: r0=190(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=185(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=329(x), r11=8(y), r12=91(width), r13=63(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 239
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 120
LDI r6, 185
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 329
LDI r11, 8
LDI r12, 91
LDI r13, 63
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
