; DESCRIPTION: Composite: Places a magenta circle of radius 48 at center (391, 150) then Places a orange dot at position (399, 31).
; PLAN: r0=391(x), r1=150(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=31(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 150
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 31
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
