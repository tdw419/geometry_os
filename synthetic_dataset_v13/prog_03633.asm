; DESCRIPTION: Composite: Sets a single magenta pixel at (38, 126) then Creates a black circular shape at (63, 66) with radius 58.
; PLAN: r0=38(x), r1=126(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=63(x), r6=66(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 126
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 63
LDI r6, 66
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
