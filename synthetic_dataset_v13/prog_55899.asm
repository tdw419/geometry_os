; DESCRIPTION: Composite: Sets a single yellow pixel at (37, 232) then Renders a black box of size 114x110 starting at (55, 129).
; PLAN: r0=37(x), r1=232(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=55(x), r6=129(y), r7=114(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 232
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 55
LDI r6, 129
LDI r7, 114
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
