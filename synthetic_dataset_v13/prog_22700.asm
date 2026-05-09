; DESCRIPTION: Composite: Sets a single green pixel at (506, 81) then Creates a orange rectangular region at (17, 231) spanning 51 by 21 pixels then Renders a white disk with center (68, 151) and radius 67.
; PLAN: r0=506(x), r1=81(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=231(y), r7=51(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=151(y), r12=67(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 506
LDI r1, 81
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 17
LDI r6, 231
LDI r7, 51
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 151
LDI r12, 67
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
