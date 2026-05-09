; DESCRIPTION: Composite: Creates a black circular shape at (312, 166) with radius 19 then Renders a white line between points (490, 139) and (176, 107).
; PLAN: r0=312(x), r1=166(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=139(y1), r7=176(x2), r8=107(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 166
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 139
LDI r7, 176
LDI r8, 107
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
