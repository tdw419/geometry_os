; DESCRIPTION: Composite: Creates a magenta rectangular region at (58, 36) spanning 73 by 89 pixels then Creates a green circular shape at (68, 128) with radius 51.
; PLAN: r0=58(x), r1=36(y), r2=73(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=128(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 36
LDI r2, 73
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 128
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
