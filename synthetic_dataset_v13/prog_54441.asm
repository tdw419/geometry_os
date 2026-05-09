; DESCRIPTION: Composite: Creates a red circular shape at (464, 119) with radius 44 then Places a blue dot at position (452, 9) then Creates a black rectangular region at (314, 79) spanning 42 by 80 pixels.
; PLAN: r0=464(x), r1=119(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x), r6=9(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=79(y), r12=42(width), r13=80(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 119
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 9
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 79
LDI r12, 42
LDI r13, 80
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
