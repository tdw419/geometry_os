; DESCRIPTION: Composite: Places a purple circle of radius 34 at center (278, 67) then Sets a single white pixel at (103, 126).
; PLAN: r0=278(x), r1=67(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x), r6=126(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 67
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 126
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
