; DESCRIPTION: Composite: Places a white dot at position (169, 93) then Renders a yellow disk with center (49, 48) and radius 20.
; PLAN: r0=169(x), r1=93(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=48(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 93
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 48
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
