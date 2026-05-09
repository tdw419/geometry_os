; DESCRIPTION: Composite: Places a purple 92x65 rectangle at position (178, 97) then Creates a purple circular shape at (148, 60) with radius 55 then Places a orange dot at position (340, 91).
; PLAN: r0=178(x), r1=97(y), r2=92(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=60(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=340(x), r11=91(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 97
LDI r2, 92
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 60
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 340
LDI r11, 91
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
