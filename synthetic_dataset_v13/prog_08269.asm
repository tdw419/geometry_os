; DESCRIPTION: Composite: Draws a purple circle centered at (261, 203) with radius 47 then Places a cyan line segment connecting (473, 9) to (131, 239).
; PLAN: r0=261(x), r1=203(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x1), r6=9(y1), r7=131(x2), r8=239(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 203
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 9
LDI r7, 131
LDI r8, 239
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
