; DESCRIPTION: Composite: Places a white circle of radius 22 at center (484, 36) then Places a purple dot at position (504, 163).
; PLAN: r0=484(x), r1=36(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x), r6=163(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 484
LDI r1, 36
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 163
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
