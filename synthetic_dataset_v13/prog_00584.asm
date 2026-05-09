; DESCRIPTION: Composite: Creates a orange rectangular region at (392, 16) spanning 102 by 105 pixels then Sets a single black pixel at (38, 153) then Places a black circle of radius 29 at center (83, 54).
; PLAN: r0=392(x), r1=16(y), r2=102(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=153(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=83(x), r11=54(y), r12=29(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 392
LDI r1, 16
LDI r2, 102
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 153
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 83
LDI r11, 54
LDI r12, 29
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
