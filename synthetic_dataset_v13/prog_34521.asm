; DESCRIPTION: Composite: Draws a blue circle centered at (469, 55) with radius 20 then Draws a magenta line from (120, 85) to (226, 174) then Renders a yellow box of size 70x104 starting at (286, 70).
; PLAN: r0=469(x), r1=55(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x1), r6=85(y1), r7=226(x2), r8=174(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=70(y), r12=70(width), r13=104(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 55
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 85
LDI r7, 226
LDI r8, 174
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 70
LDI r12, 70
LDI r13, 104
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
