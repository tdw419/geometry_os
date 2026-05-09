; DESCRIPTION: Composite: Renders a white disk with center (160, 168) and radius 66 then Places a orange dot at position (445, 208).
; PLAN: r0=160(x), r1=168(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=208(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 160
LDI r1, 168
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 208
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
