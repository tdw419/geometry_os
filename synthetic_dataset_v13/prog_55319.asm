; DESCRIPTION: Composite: Places a purple dot at position (103, 89) then Places a purple line segment connecting (35, 202) to (92, 178) then Draws a green rectangle at (40, 62) with width 82 and height 42.
; PLAN: r0=103(x), r1=89(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=202(y1), r7=92(x2), r8=178(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=62(y), r12=82(width), r13=42(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 89
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 202
LDI r7, 92
LDI r8, 178
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 62
LDI r12, 82
LDI r13, 42
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
