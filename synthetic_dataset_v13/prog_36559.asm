; DESCRIPTION: Composite: Places a orange dot at position (85, 86) then Draws a cyan circle centered at (77, 112) with radius 72 then Renders a magenta box of size 13x84 starting at (185, 12).
; PLAN: r0=85(x), r1=86(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=112(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=12(y), r12=13(width), r13=84(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 86
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 77
LDI r6, 112
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 12
LDI r12, 13
LDI r13, 84
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
