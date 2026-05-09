; DESCRIPTION: Composite: Draws a purple circle centered at (114, 160) with radius 47 then Places a orange line segment connecting (394, 68) to (303, 5).
; PLAN: r0=114(x), r1=160(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x1), r6=68(y1), r7=303(x2), r8=5(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 160
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 68
LDI r7, 303
LDI r8, 5
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
