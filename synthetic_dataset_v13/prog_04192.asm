; DESCRIPTION: Composite: Creates a magenta circular shape at (367, 201) with radius 20 then Places a orange dot at position (331, 165) then Creates a black rectangular region at (217, 32) spanning 43 by 46 pixels.
; PLAN: r0=367(x), r1=201(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x), r6=165(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=217(x), r11=32(y), r12=43(width), r13=46(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 201
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 165
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 217
LDI r11, 32
LDI r12, 43
LDI r13, 46
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
