; DESCRIPTION: Composite: Renders a green disk with center (210, 173) and radius 48 then Places a orange dot at position (183, 118).
; PLAN: r0=210(x), r1=173(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=118(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 173
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 118
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
