; DESCRIPTION: Composite: Places a red dot at position (94, 5) then Places a purple circle of radius 16 at center (291, 108).
; PLAN: r0=94(x), r1=5(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=108(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 5
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 291
LDI r6, 108
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
