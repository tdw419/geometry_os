; DESCRIPTION: Composite: Sets a single red pixel at (377, 4) then Creates a green rectangular region at (133, 11) spanning 62 by 19 pixels then Places a yellow circle of radius 19 at center (164, 191).
; PLAN: r0=377(x), r1=4(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=11(y), r7=62(width), r8=19(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x), r11=191(y), r12=19(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 377
LDI r1, 4
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 133
LDI r6, 11
LDI r7, 62
LDI r8, 19
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 191
LDI r12, 19
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
