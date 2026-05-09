; DESCRIPTION: Composite: Sets a single white pixel at (446, 248) then Places a black line segment connecting (75, 101) to (154, 241) then Draws a yellow circle centered at (424, 75) with radius 46.
; PLAN: r0=446(x), r1=248(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=75(x1), r6=101(y1), r7=154(x2), r8=241(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=424(x), r11=75(y), r12=46(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 446
LDI r1, 248
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 101
LDI r7, 154
LDI r8, 241
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 75
LDI r12, 46
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
