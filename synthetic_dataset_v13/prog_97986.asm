; DESCRIPTION: Composite: Renders a orange line between points (416, 225) and (227, 152) then Places a purple dot at position (300, 32) then Draws a orange rectangle at (308, 46) with width 91 and height 29.
; PLAN: r0=416(x1), r1=225(y1), r2=227(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=32(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=308(x), r11=46(y), r12=91(width), r13=29(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 225
LDI r2, 227
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 32
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 308
LDI r11, 46
LDI r12, 91
LDI r13, 29
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
