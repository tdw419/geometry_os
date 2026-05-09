; DESCRIPTION: Composite: Draws a white circle centered at (122, 176) with radius 44 then Places a yellow line segment connecting (176, 33) to (165, 170).
; PLAN: r0=122(x), r1=176(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x1), r6=33(y1), r7=165(x2), r8=170(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 122
LDI r1, 176
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 33
LDI r7, 165
LDI r8, 170
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
