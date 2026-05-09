; DESCRIPTION: Composite: Places a black dot at position (115, 57) then Renders a black disk with center (416, 85) and radius 76.
; PLAN: r0=115(x), r1=57(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=85(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 115
LDI r1, 57
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 416
LDI r6, 85
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
