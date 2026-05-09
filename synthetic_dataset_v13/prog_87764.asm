; DESCRIPTION: Composite: Sets a single black pixel at (505, 42) then Places a yellow circle of radius 27 at center (116, 141).
; PLAN: r0=505(x), r1=42(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=141(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 505
LDI r1, 42
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 116
LDI r6, 141
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
