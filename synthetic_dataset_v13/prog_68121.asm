; DESCRIPTION: Composite: Renders a orange disk with center (287, 125) and radius 36 then Places a magenta dot at position (275, 178).
; PLAN: r0=287(x), r1=125(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=178(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 125
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 178
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
