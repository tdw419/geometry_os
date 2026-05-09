; DESCRIPTION: Composite: Sets a single white pixel at (72, 110) then Places a blue 17x88 rectangle at position (47, 69).
; PLAN: r0=72(x), r1=110(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=47(x), r6=69(y), r7=17(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 110
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 47
LDI r6, 69
LDI r7, 17
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
