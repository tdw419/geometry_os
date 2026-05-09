; DESCRIPTION: Composite: Renders a black line between points (123, 238) and (129, 3) then Creates a black rectangular region at (225, 69) spanning 23 by 90 pixels then Places a orange dot at position (239, 247).
; PLAN: r0=123(x1), r1=238(y1), r2=129(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=69(y), r7=23(width), r8=90(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=247(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 238
LDI r2, 129
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 69
LDI r7, 23
LDI r8, 90
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 247
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
