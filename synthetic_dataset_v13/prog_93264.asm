; DESCRIPTION: Composite: Draws a green circle centered at (363, 97) with radius 79 then Places a yellow dot at position (55, 38) then Creates a yellow rectangular region at (13, 112) spanning 49 by 58 pixels.
; PLAN: r0=363(x), r1=97(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=38(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=13(x), r11=112(y), r12=49(width), r13=58(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 97
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 38
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 13
LDI r11, 112
LDI r12, 49
LDI r13, 58
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
