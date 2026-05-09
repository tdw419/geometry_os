; DESCRIPTION: Composite: Creates a cyan rectangular region at (31, 49) spanning 110 by 114 pixels then Places a black circle of radius 77 at center (78, 127).
; PLAN: r0=31(x), r1=49(y), r2=110(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=127(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 31
LDI r1, 49
LDI r2, 110
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 127
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
