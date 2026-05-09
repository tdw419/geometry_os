; DESCRIPTION: Composite: Places a black dot at position (261, 255) then Creates a green rectangular region at (313, 96) spanning 103 by 18 pixels then Places a orange circle of radius 55 at center (429, 188).
; PLAN: r0=261(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=96(y), r7=103(width), r8=18(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x), r11=188(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 313
LDI r6, 96
LDI r7, 103
LDI r8, 18
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 188
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
