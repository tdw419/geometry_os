; DESCRIPTION: Composite: Places a purple dot at position (77, 205) then Places a black circle of radius 67 at center (137, 68).
; PLAN: r0=77(x), r1=205(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=68(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 77
LDI r1, 205
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 68
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
