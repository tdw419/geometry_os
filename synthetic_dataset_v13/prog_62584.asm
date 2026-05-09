; DESCRIPTION: Composite: Renders a orange disk with center (393, 116) and radius 12 then Places a magenta dot at position (509, 63).
; PLAN: r0=393(x), r1=116(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=509(x), r6=63(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 116
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 509
LDI r6, 63
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
