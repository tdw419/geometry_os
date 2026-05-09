; DESCRIPTION: Composite: Sets a single magenta pixel at (230, 74) then Places a black circle of radius 50 at center (392, 98).
; PLAN: r0=230(x), r1=74(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=98(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 230
LDI r1, 74
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 98
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
