; DESCRIPTION: Composite: Places a yellow dot at position (99, 141) then Draws a red circle centered at (457, 216) with radius 26.
; PLAN: r0=99(x), r1=141(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=216(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 141
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 457
LDI r6, 216
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
