; DESCRIPTION: Composite: Sets a single red pixel at (219, 74) then Places a magenta line segment connecting (314, 138) to (12, 78) then Draws a red circle centered at (125, 71) with radius 58.
; PLAN: r0=219(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=314(x1), r6=138(y1), r7=12(x2), r8=78(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=71(y), r12=58(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 219
LDI r1, 74
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 314
LDI r6, 138
LDI r7, 12
LDI r8, 78
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 71
LDI r12, 58
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
