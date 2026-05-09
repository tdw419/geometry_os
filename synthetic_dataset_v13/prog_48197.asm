; DESCRIPTION: Composite: Places a white dot at position (22, 49) then Renders a orange disk with center (441, 84) and radius 60.
; PLAN: r0=22(x), r1=49(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=84(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 22
LDI r1, 49
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 84
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
