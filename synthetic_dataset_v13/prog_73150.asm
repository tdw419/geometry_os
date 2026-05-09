; DESCRIPTION: Composite: Places a red line segment connecting (7, 94) to (499, 135) then Draws a black circle centered at (109, 175) with radius 71.
; PLAN: r0=7(x1), r1=94(y1), r2=499(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=175(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 7
LDI r1, 94
LDI r2, 499
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 175
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
