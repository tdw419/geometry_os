; DESCRIPTION: Composite: Draws a purple circle centered at (251, 53) with radius 46 then Renders a orange line between points (278, 245) and (303, 94).
; PLAN: r0=251(x), r1=53(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x1), r6=245(y1), r7=303(x2), r8=94(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 53
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 245
LDI r7, 303
LDI r8, 94
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
