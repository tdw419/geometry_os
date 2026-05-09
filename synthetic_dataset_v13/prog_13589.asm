; DESCRIPTION: Composite: Places a magenta dot at position (89, 222) then Places a purple circle of radius 67 at center (251, 153).
; PLAN: r0=89(x), r1=222(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=153(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 89
LDI r1, 222
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 153
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
