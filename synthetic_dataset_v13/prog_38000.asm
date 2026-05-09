; DESCRIPTION: Composite: Places a yellow dot at position (14, 242) then Renders a white disk with center (216, 159) and radius 65.
; PLAN: r0=14(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=159(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 14
LDI r1, 242
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 216
LDI r6, 159
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
