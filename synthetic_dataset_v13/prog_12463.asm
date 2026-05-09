; DESCRIPTION: Composite: Creates a yellow rectangular region at (449, 14) spanning 39 by 41 pixels then Renders a red disk with center (147, 90) and radius 75.
; PLAN: r0=449(x), r1=14(y), r2=39(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x), r6=90(y), r7=75(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 14
LDI r2, 39
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 90
LDI r7, 75
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
