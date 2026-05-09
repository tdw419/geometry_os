; DESCRIPTION: Composite: Places a black dot at position (129, 146) then Renders a magenta line between points (109, 67) and (147, 239) then Draws a red circle centered at (303, 155) with radius 62.
; PLAN: r0=129(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=67(y1), r7=147(x2), r8=239(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=155(y), r12=62(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 146
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 109
LDI r6, 67
LDI r7, 147
LDI r8, 239
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 155
LDI r12, 62
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
