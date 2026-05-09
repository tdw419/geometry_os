; DESCRIPTION: Composite: Places a white dot at position (454, 60) then Creates a blue circular shape at (103, 155) with radius 55.
; PLAN: r0=454(x), r1=60(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=155(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 60
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 155
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
