; DESCRIPTION: Composite: Sets a single blue pixel at (458, 35) then Places a green 84x80 rectangle at position (292, 144) then Creates a magenta circular shape at (414, 96) with radius 80.
; PLAN: r0=458(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=144(y), r7=84(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=96(y), r12=80(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 35
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 144
LDI r7, 84
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 96
LDI r12, 80
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
