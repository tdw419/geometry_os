; DESCRIPTION: Composite: Draws a blue circle centered at (422, 165) with radius 70 then Places a magenta dot at position (251, 187) then Places a purple 88x41 rectangle at position (128, 142).
; PLAN: r0=422(x), r1=165(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=187(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=142(y), r12=88(width), r13=41(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 165
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 187
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 128
LDI r11, 142
LDI r12, 88
LDI r13, 41
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
