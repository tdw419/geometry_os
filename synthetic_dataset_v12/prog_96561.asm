; DESCRIPTION: Composite: Places a white line segment connecting (104, 33) to (418, 151) then Draws a yellow circle centered at (36, 56) with radius 29.
; PLAN: r0=104(x1), r1=33(y1), r2=418(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=56(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 33
LDI r2, 418
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 56
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
