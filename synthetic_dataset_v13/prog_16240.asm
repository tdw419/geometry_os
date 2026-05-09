; DESCRIPTION: Composite: Creates a black rectangular region at (11, 57) spanning 70 by 101 pixels then Sets a single orange pixel at (282, 23) then Renders a cyan disk with center (104, 153) and radius 69.
; PLAN: r0=11(x), r1=57(y), r2=70(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=23(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=104(x), r11=153(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 11
LDI r1, 57
LDI r2, 70
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 23
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 104
LDI r11, 153
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
