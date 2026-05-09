; DESCRIPTION: Composite: Renders a purple disk with center (343, 50) and radius 43 then Draws a magenta rectangle at (237, 120) with width 57 and height 33 then Places a purple dot at position (219, 45).
; PLAN: r0=343(x), r1=50(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=120(y), r7=57(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=45(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 343
LDI r1, 50
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 120
LDI r7, 57
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 45
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
