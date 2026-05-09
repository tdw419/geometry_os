; DESCRIPTION: Composite: Sets a single green pixel at (280, 11) then Places a magenta circle of radius 34 at center (81, 86).
; PLAN: r0=280(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=86(y), r7=34(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 81
LDI r6, 86
LDI r7, 34
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
