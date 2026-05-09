; DESCRIPTION: Composite: Draws a white rectangle at (264, 23) with width 65 and height 21 then Places a purple line segment connecting (338, 240) to (201, 100).
; PLAN: r0=264(x), r1=23(y), r2=65(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x1), r6=240(y1), r7=201(x2), r8=100(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 23
LDI r2, 65
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 240
LDI r7, 201
LDI r8, 100
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
