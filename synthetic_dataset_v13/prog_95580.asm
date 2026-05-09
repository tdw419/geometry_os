; DESCRIPTION: Composite: Places a black dot at position (198, 122) then Places a purple circle of radius 32 at center (457, 131).
; PLAN: r0=198(x), r1=122(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=131(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 122
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 457
LDI r6, 131
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
