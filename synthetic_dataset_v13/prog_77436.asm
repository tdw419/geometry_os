; DESCRIPTION: Composite: Renders a yellow disk with center (414, 139) and radius 57 then Places a magenta dot at position (374, 74).
; PLAN: r0=414(x), r1=139(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=74(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 139
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 74
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
