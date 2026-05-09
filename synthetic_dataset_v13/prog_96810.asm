; DESCRIPTION: Composite: Renders a blue disk with center (432, 101) and radius 18 then Places a red dot at position (88, 68).
; PLAN: r0=432(x), r1=101(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=68(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 101
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 68
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
