; DESCRIPTION: Composite: Draws a purple circle centered at (128, 157) with radius 79 then Places a blue dot at position (55, 219) then Renders a white box of size 100x47 starting at (174, 118).
; PLAN: r0=128(x), r1=157(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=219(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=118(y), r12=100(width), r13=47(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 157
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 219
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 174
LDI r11, 118
LDI r12, 100
LDI r13, 47
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
