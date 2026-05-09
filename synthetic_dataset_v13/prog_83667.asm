; DESCRIPTION: Composite: Creates a yellow circular shape at (402, 159) with radius 11 then Places a magenta dot at position (505, 127) then Creates a purple rectangular region at (212, 115) spanning 75 by 39 pixels.
; PLAN: r0=402(x), r1=159(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x), r6=127(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=115(y), r12=75(width), r13=39(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 159
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 127
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 212
LDI r11, 115
LDI r12, 75
LDI r13, 39
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
