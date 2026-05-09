; DESCRIPTION: Composite: Renders a green disk with center (264, 106) and radius 49 then Places a magenta dot at position (463, 86).
; PLAN: r0=264(x), r1=106(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=86(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 106
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 86
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
