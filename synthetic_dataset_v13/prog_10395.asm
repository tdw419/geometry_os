; DESCRIPTION: Composite: Draws a orange line from (58, 118) to (398, 222) then Renders a cyan disk with center (396, 96) and radius 45 then Creates a white rectangular region at (399, 102) spanning 81 by 71 pixels.
; PLAN: r0=58(x1), r1=118(y1), r2=398(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=96(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x), r11=102(y), r12=81(width), r13=71(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 118
LDI r2, 398
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 96
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 102
LDI r12, 81
LDI r13, 71
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
