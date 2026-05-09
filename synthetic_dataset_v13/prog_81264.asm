; DESCRIPTION: Composite: Places a blue dot at position (341, 13) then Renders a white disk with center (277, 179) and radius 55.
; PLAN: r0=341(x), r1=13(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=179(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 13
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 179
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
