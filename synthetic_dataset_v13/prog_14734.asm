; DESCRIPTION: Composite: Sets a single black pixel at (388, 52) then Renders a black line between points (28, 50) and (125, 38) then Draws a purple circle centered at (445, 101) with radius 34.
; PLAN: r0=388(x), r1=52(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=28(x1), r6=50(y1), r7=125(x2), r8=38(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=445(x), r11=101(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 52
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 28
LDI r6, 50
LDI r7, 125
LDI r8, 38
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 101
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
