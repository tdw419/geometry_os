; DESCRIPTION: Composite: Creates a cyan rectangular region at (221, 15) spanning 45 by 37 pixels then Creates a black circular shape at (265, 206) with radius 44.
; PLAN: r0=221(x), r1=15(y), r2=45(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=206(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 221
LDI r1, 15
LDI r2, 45
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 206
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
