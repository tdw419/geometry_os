; DESCRIPTION: Composite: Places a blue dot at position (300, 107) then Places a purple circle of radius 66 at center (140, 135).
; PLAN: r0=300(x), r1=107(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=135(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 300
LDI r1, 107
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 135
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
