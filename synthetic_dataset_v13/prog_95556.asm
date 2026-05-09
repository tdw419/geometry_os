; DESCRIPTION: Composite: Renders a magenta disk with center (364, 93) and radius 43 then Places a black dot at position (234, 117).
; PLAN: r0=364(x), r1=93(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=117(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 93
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 117
LDI r7, 0x000000
PSET r5, r6, r7
HALT
