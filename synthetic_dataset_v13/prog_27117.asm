; DESCRIPTION: Composite: Renders a green disk with center (148, 228) and radius 12 then Draws a magenta rectangle at (361, 46) with width 100 and height 101 then Places a black dot at position (356, 52).
; PLAN: r0=148(x), r1=228(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=46(y), r7=100(width), r8=101(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=52(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 228
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 46
LDI r7, 100
LDI r8, 101
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 52
LDI r12, 0x000000
PSET r10, r11, r12
HALT
