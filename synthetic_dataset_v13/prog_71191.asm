; DESCRIPTION: Composite: Places a magenta circle of radius 13 at center (99, 55) then Places a yellow dot at position (413, 204).
; PLAN: r0=99(x), r1=55(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=204(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 55
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 204
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
