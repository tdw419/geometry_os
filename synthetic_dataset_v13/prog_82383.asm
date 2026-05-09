; DESCRIPTION: Composite: Sets a single red pixel at (347, 142) then Draws a purple rectangle at (186, 36) with width 68 and height 106 then Places a yellow line segment connecting (330, 42) to (129, 20).
; PLAN: r0=347(x), r1=142(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=36(y), r7=68(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=330(x1), r11=42(y1), r12=129(x2), r13=20(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 142
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 186
LDI r6, 36
LDI r7, 68
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 42
LDI r12, 129
LDI r13, 20
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
