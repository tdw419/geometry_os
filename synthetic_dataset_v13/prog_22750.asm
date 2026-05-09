; DESCRIPTION: Composite: Renders a yellow box of size 15x14 starting at (165, 95) then Places a red line segment connecting (207, 79) to (337, 247) then Draws a orange circle centered at (304, 60) with radius 55.
; PLAN: r0=165(x), r1=95(y), r2=15(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=79(y1), r7=337(x2), r8=247(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=60(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 95
LDI r2, 15
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 79
LDI r7, 337
LDI r8, 247
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 60
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
