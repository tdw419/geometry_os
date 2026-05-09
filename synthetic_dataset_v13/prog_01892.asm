; DESCRIPTION: Composite: Creates a black circular shape at (36, 134) with radius 11 then Renders a blue box of size 36x19 starting at (89, 151).
; PLAN: r0=36(x), r1=134(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=151(y), r7=36(width), r8=19(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 134
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 151
LDI r7, 36
LDI r8, 19
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
