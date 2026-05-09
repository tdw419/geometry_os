; DESCRIPTION: Composite: Renders a yellow disk with center (123, 74) and radius 68 then Places a orange dot at position (120, 118).
; PLAN: r0=123(x), r1=74(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=118(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 74
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 118
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
