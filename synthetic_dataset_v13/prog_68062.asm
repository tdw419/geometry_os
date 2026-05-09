; DESCRIPTION: Composite: Draws a orange circle centered at (118, 106) with radius 76 then Renders a white box of size 29x47 starting at (150, 108) then Places a red line segment connecting (55, 230) to (465, 56).
; PLAN: r0=118(x), r1=106(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=108(y), r7=29(width), r8=47(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x1), r11=230(y1), r12=465(x2), r13=56(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 106
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 108
LDI r7, 29
LDI r8, 47
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 230
LDI r12, 465
LDI r13, 56
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
