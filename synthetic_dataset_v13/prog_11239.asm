; DESCRIPTION: Composite: Renders a orange line between points (19, 17) and (439, 77) then Places a white dot at position (486, 134) then Creates a black rectangular region at (327, 40) spanning 50 by 27 pixels.
; PLAN: r0=19(x1), r1=17(y1), r2=439(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=134(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=40(y), r12=50(width), r13=27(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 17
LDI r2, 439
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 134
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 327
LDI r11, 40
LDI r12, 50
LDI r13, 27
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
