; DESCRIPTION: Composite: Places a black dot at position (235, 68) then Places a white circle of radius 65 at center (104, 130).
; PLAN: r0=235(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=104(x), r6=130(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 68
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 104
LDI r6, 130
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
