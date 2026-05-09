; DESCRIPTION: Composite: Sets a single red pixel at (166, 49) then Places a yellow line segment connecting (401, 236) to (201, 146) then Draws a red rectangle at (176, 58) with width 116 and height 88.
; PLAN: r0=166(x), r1=49(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=236(y1), r7=201(x2), r8=146(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=58(y), r12=116(width), r13=88(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 49
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 401
LDI r6, 236
LDI r7, 201
LDI r8, 146
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 58
LDI r12, 116
LDI r13, 88
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
