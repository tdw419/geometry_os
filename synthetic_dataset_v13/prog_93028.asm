; DESCRIPTION: Composite: Draws a magenta circle centered at (285, 134) with radius 60 then Places a orange dot at position (409, 196) then Creates a white rectangular region at (101, 211) spanning 29 by 22 pixels.
; PLAN: r0=285(x), r1=134(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=196(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=211(y), r12=29(width), r13=22(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 134
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 196
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 101
LDI r11, 211
LDI r12, 29
LDI r13, 22
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
