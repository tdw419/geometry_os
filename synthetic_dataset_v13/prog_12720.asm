; DESCRIPTION: Composite: Places a purple dot at position (88, 158) then Renders a yellow box of size 18x78 starting at (145, 106).
; PLAN: r0=88(x), r1=158(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=106(y), r7=18(width), r8=78(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 158
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 106
LDI r7, 18
LDI r8, 78
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
