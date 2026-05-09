; DESCRIPTION: Composite: Creates a magenta circular shape at (237, 93) with radius 27 then Draws a orange rectangle at (44, 26) with width 105 and height 28 then Places a red dot at position (348, 32).
; PLAN: r0=237(x), r1=93(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=26(y), r7=105(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=348(x), r11=32(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 93
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 26
LDI r7, 105
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 32
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
