; DESCRIPTION: Composite: Sets a single black pixel at (209, 136) then Places a orange circle of radius 73 at center (97, 117).
; PLAN: r0=209(x), r1=136(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=117(y), r7=73(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 136
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 97
LDI r6, 117
LDI r7, 73
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
