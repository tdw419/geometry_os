; DESCRIPTION: Composite: Renders a green disk with center (355, 91) and radius 49 then Places a orange dot at position (38, 58).
; PLAN: r0=355(x), r1=91(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=58(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 91
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 58
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
