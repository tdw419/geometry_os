; DESCRIPTION: Composite: Creates a red circular shape at (73, 119) with radius 41 then Draws a red rectangle at (93, 10) with width 68 and height 118.
; PLAN: r0=73(x), r1=119(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=10(y), r7=68(width), r8=118(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 119
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 10
LDI r7, 68
LDI r8, 118
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
