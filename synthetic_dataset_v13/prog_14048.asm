; DESCRIPTION: Composite: Renders a green disk with center (204, 144) and radius 42 then Places a green dot at position (165, 69).
; PLAN: r0=204(x), r1=144(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=69(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 204
LDI r1, 144
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 69
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
