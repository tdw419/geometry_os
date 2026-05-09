; DESCRIPTION: Composite: Renders a orange box of size 42x85 starting at (88, 4) then Creates a green circular shape at (297, 155) with radius 56 then Sets a single magenta pixel at (280, 0).
; PLAN: r0=88(x), r1=4(y), r2=42(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=155(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=0(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 88
LDI r1, 4
LDI r2, 42
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 155
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 0
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
