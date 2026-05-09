; DESCRIPTION: Composite: Sets a single purple pixel at (305, 68) then Draws a black circle centered at (254, 61) with radius 53.
; PLAN: r0=305(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=61(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 254
LDI r6, 61
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
