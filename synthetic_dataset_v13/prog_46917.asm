; DESCRIPTION: Composite: Places a black circle of radius 70 at center (404, 145) then Places a orange dot at position (355, 189) then Creates a white rectangular region at (342, 196) spanning 63 by 44 pixels.
; PLAN: r0=404(x), r1=145(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=189(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=196(y), r12=63(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 145
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 189
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 342
LDI r11, 196
LDI r12, 63
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
