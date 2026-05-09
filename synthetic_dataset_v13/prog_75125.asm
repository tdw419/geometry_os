; DESCRIPTION: Composite: Places a purple dot at position (24, 101) then Creates a red rectangular region at (178, 38) spanning 86 by 23 pixels then Renders a red disk with center (257, 74) and radius 49.
; PLAN: r0=24(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=38(y), r7=86(width), r8=23(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x), r11=74(y), r12=49(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 38
LDI r7, 86
LDI r8, 23
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 74
LDI r12, 49
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
