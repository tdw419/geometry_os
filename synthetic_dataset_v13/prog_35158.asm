; DESCRIPTION: Composite: Renders a orange disk with center (93, 188) and radius 57 then Places a magenta dot at position (169, 173).
; PLAN: r0=93(x), r1=188(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=173(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 188
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 173
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
