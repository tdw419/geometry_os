; DESCRIPTION: Composite: Places a purple circle of radius 24 at center (213, 67) then Sets a single red pixel at (342, 1).
; PLAN: r0=213(x), r1=67(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=1(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 213
LDI r1, 67
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 1
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
