; DESCRIPTION: Composite: Creates a red rectangular region at (343, 228) spanning 95 by 13 pixels then Sets a single orange pixel at (233, 184) then Draws a green circle centered at (212, 83) with radius 14.
; PLAN: r0=343(x), r1=228(y), r2=95(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=184(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=83(y), r12=14(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 343
LDI r1, 228
LDI r2, 95
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 184
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 212
LDI r11, 83
LDI r12, 14
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
