; DESCRIPTION: Composite: Places a black circle of radius 52 at center (343, 175) then Renders a black box of size 78x115 starting at (135, 66).
; PLAN: r0=343(x), r1=175(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=66(y), r7=78(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 175
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 66
LDI r7, 78
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
