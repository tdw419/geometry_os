; DESCRIPTION: Composite: Renders a yellow disk with center (74, 217) and radius 15 then Draws a orange line from (267, 15) to (381, 104).
; PLAN: r0=74(x), r1=217(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x1), r6=15(y1), r7=381(x2), r8=104(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 217
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 15
LDI r7, 381
LDI r8, 104
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
