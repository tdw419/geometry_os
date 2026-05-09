; DESCRIPTION: Composite: Sets a single blue pixel at (251, 63) then Places a magenta circle of radius 46 at center (382, 91).
; PLAN: r0=251(x), r1=63(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=91(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 63
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 91
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
