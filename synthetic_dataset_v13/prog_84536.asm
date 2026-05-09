; DESCRIPTION: Composite: Places a yellow dot at position (49, 255) then Creates a purple rectangular region at (132, 173) spanning 36 by 55 pixels then Creates a green circular shape at (300, 108) with radius 80.
; PLAN: r0=49(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=173(y), r7=36(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=108(y), r12=80(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 132
LDI r6, 173
LDI r7, 36
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 108
LDI r12, 80
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
