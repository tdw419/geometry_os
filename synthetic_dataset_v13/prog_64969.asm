; DESCRIPTION: Composite: Sets a single red pixel at (163, 153) then Places a orange line segment connecting (29, 177) to (464, 147) then Renders a white box of size 101x26 starting at (82, 98).
; PLAN: r0=163(x), r1=153(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=29(x1), r6=177(y1), r7=464(x2), r8=147(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=98(y), r12=101(width), r13=26(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 153
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 29
LDI r6, 177
LDI r7, 464
LDI r8, 147
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 98
LDI r12, 101
LDI r13, 26
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
