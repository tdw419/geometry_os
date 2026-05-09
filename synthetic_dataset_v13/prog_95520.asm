; DESCRIPTION: Composite: Renders a orange line between points (441, 119) and (302, 106) then Draws a white circle centered at (302, 96) with radius 49 then Places a cyan 117x39 rectangle at position (40, 211).
; PLAN: r0=441(x1), r1=119(y1), r2=302(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=96(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=211(y), r12=117(width), r13=39(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 119
LDI r2, 302
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 96
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 211
LDI r12, 117
LDI r13, 39
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
