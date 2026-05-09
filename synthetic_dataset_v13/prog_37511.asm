; DESCRIPTION: Composite: Creates a purple circular shape at (381, 92) with radius 40 then Places a white 52x51 rectangle at position (451, 188).
; PLAN: r0=381(x), r1=92(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=188(y), r7=52(width), r8=51(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 92
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 188
LDI r7, 52
LDI r8, 51
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
