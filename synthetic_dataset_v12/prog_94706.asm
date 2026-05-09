; DESCRIPTION: Composite: Sets a single black pixel at (443, 127) then Creates a green rectangular region at (52, 6) spanning 62 by 118 pixels.
; PLAN: r0=443(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=52(x), r6=6(y), r7=62(width), r8=118(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 52
LDI r6, 6
LDI r7, 62
LDI r8, 118
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
