; DESCRIPTION: Composite: Creates a white circular shape at (194, 110) with radius 27 then Draws a blue line from (17, 175) to (275, 42) then Places a black 43x47 rectangle at position (222, 153).
; PLAN: r0=194(x), r1=110(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x1), r6=175(y1), r7=275(x2), r8=42(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=153(y), r12=43(width), r13=47(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 110
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 175
LDI r7, 275
LDI r8, 42
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 153
LDI r12, 43
LDI r13, 47
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
