; DESCRIPTION: Composite: Sets a single white pixel at (348, 69) then Places a blue line segment connecting (93, 15) to (203, 92) then Places a white circle of radius 23 at center (425, 49).
; PLAN: r0=348(x), r1=69(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=93(x1), r6=15(y1), r7=203(x2), r8=92(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=425(x), r11=49(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 69
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 15
LDI r7, 203
LDI r8, 92
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 49
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
