; DESCRIPTION: Composite: Sets a single magenta pixel at (260, 51) then Renders a orange disk with center (242, 159) and radius 34.
; PLAN: r0=260(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=159(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 242
LDI r6, 159
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
