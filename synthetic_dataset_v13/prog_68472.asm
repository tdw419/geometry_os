; DESCRIPTION: Composite: Places a blue dot at position (242, 156) then Places a magenta circle of radius 21 at center (363, 196).
; PLAN: r0=242(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=196(y), r7=21(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 196
LDI r7, 21
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
