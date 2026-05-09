; DESCRIPTION: Composite: Creates a white rectangular region at (156, 128) spanning 118 by 27 pixels then Draws a red circle centered at (98, 205) with radius 27.
; PLAN: r0=156(x), r1=128(y), r2=118(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=205(y), r7=27(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 128
LDI r2, 118
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 205
LDI r7, 27
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
