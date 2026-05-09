; DESCRIPTION: Composite: Renders a red disk with center (457, 187) and radius 50 then Places a orange dot at position (78, 29).
; PLAN: r0=457(x), r1=187(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=29(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 187
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 29
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
