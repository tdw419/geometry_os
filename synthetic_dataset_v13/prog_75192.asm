; DESCRIPTION: Composite: Places a yellow dot at position (441, 246) then Places a magenta circle of radius 74 at center (130, 100).
; PLAN: r0=441(x), r1=246(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=100(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 441
LDI r1, 246
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 130
LDI r6, 100
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
