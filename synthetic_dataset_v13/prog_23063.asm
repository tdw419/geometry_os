; DESCRIPTION: Composite: Places a magenta dot at position (477, 75) then Creates a green rectangular region at (51, 183) spanning 86 by 48 pixels then Creates a magenta circular shape at (118, 125) with radius 43.
; PLAN: r0=477(x), r1=75(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=183(y), r7=86(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=118(x), r11=125(y), r12=43(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 477
LDI r1, 75
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 51
LDI r6, 183
LDI r7, 86
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 125
LDI r12, 43
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
