; DESCRIPTION: Composite: Draws a orange circle centered at (318, 125) with radius 74 then Places a white line segment connecting (476, 67) to (425, 149).
; PLAN: r0=318(x), r1=125(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x1), r6=67(y1), r7=425(x2), r8=149(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 125
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 67
LDI r7, 425
LDI r8, 149
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
