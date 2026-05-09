; DESCRIPTION: Composite: Sets a single blue pixel at (443, 204) then Places a white circle of radius 17 at center (318, 207).
; PLAN: r0=443(x), r1=204(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=207(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 204
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 207
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
