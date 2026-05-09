; DESCRIPTION: Composite: Places a black 46x35 rectangle at position (103, 146) then Places a black line segment connecting (341, 37) to (388, 59) then Draws a red circle centered at (319, 117) with radius 37.
; PLAN: r0=103(x), r1=146(y), r2=46(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x1), r6=37(y1), r7=388(x2), r8=59(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=319(x), r11=117(y), r12=37(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 146
LDI r2, 46
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 37
LDI r7, 388
LDI r8, 59
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 117
LDI r12, 37
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
