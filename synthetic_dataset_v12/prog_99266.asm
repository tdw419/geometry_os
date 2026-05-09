; DESCRIPTION: Composite: Creates a orange rectangular region at (77, 72) spanning 36 by 91 pixels then Draws a green circle centered at (461, 171) with radius 42.
; PLAN: r0=77(x), r1=72(y), r2=36(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=171(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 77
LDI r1, 72
LDI r2, 36
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 171
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
