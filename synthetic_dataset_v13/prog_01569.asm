; DESCRIPTION: Composite: Places a white dot at position (253, 102) then Places a green circle of radius 43 at center (246, 133).
; PLAN: r0=253(x), r1=102(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=133(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 253
LDI r1, 102
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 133
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
