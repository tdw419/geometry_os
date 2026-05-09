; DESCRIPTION: Composite: Creates a yellow rectangular region at (78, 236) spanning 94 by 11 pixels then Places a green circle of radius 47 at center (291, 195).
; PLAN: r0=78(x), r1=236(y), r2=94(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=195(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 236
LDI r2, 94
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 195
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
