; DESCRIPTION: Composite: Renders a yellow disk with center (135, 70) and radius 26 then Places a orange dot at position (248, 19).
; PLAN: r0=135(x), r1=70(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=19(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 70
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 19
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
