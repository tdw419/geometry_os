; DESCRIPTION: Composite: Draws a yellow circle centered at (265, 179) with radius 22 then Renders a red box of size 15x72 starting at (39, 114).
; PLAN: r0=265(x), r1=179(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=114(y), r7=15(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 179
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 114
LDI r7, 15
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
