; DESCRIPTION: Composite: Draws a orange circle centered at (175, 86) with radius 61 then Places a yellow 94x83 rectangle at position (360, 85) then Renders a yellow line between points (395, 152) and (150, 58).
; PLAN: r0=175(x), r1=86(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=85(y), r7=94(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=395(x1), r11=152(y1), r12=150(x2), r13=58(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 86
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 85
LDI r7, 94
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 152
LDI r12, 150
LDI r13, 58
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
