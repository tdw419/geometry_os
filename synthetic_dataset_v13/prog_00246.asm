; DESCRIPTION: Composite: Sets a single black pixel at (56, 62) then Draws a black rectangle at (389, 13) with width 80 and height 87 then Renders a yellow line between points (22, 61) and (372, 135).
; PLAN: r0=56(x), r1=62(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=13(y), r7=80(width), r8=87(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x1), r11=61(y1), r12=372(x2), r13=135(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 62
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 389
LDI r6, 13
LDI r7, 80
LDI r8, 87
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 61
LDI r12, 372
LDI r13, 135
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
