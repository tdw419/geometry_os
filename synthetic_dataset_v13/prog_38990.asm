; DESCRIPTION: Composite: Places a yellow dot at position (208, 78) then Places a magenta circle of radius 75 at center (328, 115).
; PLAN: r0=208(x), r1=78(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=115(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 208
LDI r1, 78
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 328
LDI r6, 115
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
