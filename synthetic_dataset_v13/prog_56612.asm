; DESCRIPTION: Composite: Places a blue dot at position (473, 140) then Creates a white circular shape at (162, 164) with radius 33.
; PLAN: r0=473(x), r1=140(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=164(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 473
LDI r1, 140
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 164
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
