; DESCRIPTION: Composite: Places a white line segment connecting (403, 159) to (490, 217) then Draws a black circle centered at (425, 118) with radius 57.
; PLAN: r0=403(x1), r1=159(y1), r2=490(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=118(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 159
LDI r2, 490
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 118
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
