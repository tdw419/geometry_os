; DESCRIPTION: Composite: Sets a single white pixel at (392, 109) then Places a purple circle of radius 65 at center (310, 67).
; PLAN: r0=392(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=67(y), r7=65(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 392
LDI r1, 109
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 67
LDI r7, 65
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
