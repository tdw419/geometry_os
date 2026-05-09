; DESCRIPTION: Composite: Draws a red circle centered at (135, 82) with radius 62 then Places a orange dot at position (270, 70) then Creates a yellow rectangular region at (347, 16) spanning 51 by 11 pixels.
; PLAN: r0=135(x), r1=82(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=70(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=347(x), r11=16(y), r12=51(width), r13=11(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 82
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 70
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 347
LDI r11, 16
LDI r12, 51
LDI r13, 11
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
