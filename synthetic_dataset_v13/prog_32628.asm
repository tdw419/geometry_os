; DESCRIPTION: Composite: Sets a single magenta pixel at (301, 198) then Places a orange circle of radius 67 at center (268, 145).
; PLAN: r0=301(x), r1=198(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=145(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 301
LDI r1, 198
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 268
LDI r6, 145
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
