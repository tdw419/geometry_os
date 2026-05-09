; DESCRIPTION: Composite: Places a yellow dot at position (41, 105) then Draws a red circle centered at (242, 174) with radius 58 then Places a purple line segment connecting (500, 111) to (304, 118).
; PLAN: r0=41(x), r1=105(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=174(y), r7=58(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=111(y1), r12=304(x2), r13=118(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 105
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 242
LDI r6, 174
LDI r7, 58
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 111
LDI r12, 304
LDI r13, 118
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
