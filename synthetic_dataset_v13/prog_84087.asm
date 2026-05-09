; DESCRIPTION: Composite: Creates a orange rectangular region at (177, 76) spanning 114 by 31 pixels then Places a yellow circle of radius 68 at center (94, 135).
; PLAN: r0=177(x), r1=76(y), r2=114(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=135(y), r7=68(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 76
LDI r2, 114
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 135
LDI r7, 68
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
