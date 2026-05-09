; DESCRIPTION: Composite: Sets a single red pixel at (133, 143) then Places a black circle of radius 65 at center (258, 113).
; PLAN: r0=133(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=113(y), r7=65(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 143
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 258
LDI r6, 113
LDI r7, 65
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
