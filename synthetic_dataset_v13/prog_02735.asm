; DESCRIPTION: Composite: Renders a orange line between points (1, 34) and (303, 14) then Creates a orange circular shape at (302, 194) with radius 29 then Places a black 15x57 rectangle at position (154, 18).
; PLAN: r0=1(x1), r1=34(y1), r2=303(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=194(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x), r11=18(y), r12=15(width), r13=57(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 34
LDI r2, 303
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 194
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 18
LDI r12, 15
LDI r13, 57
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
