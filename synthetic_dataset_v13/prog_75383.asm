; DESCRIPTION: Composite: Draws a white circle centered at (363, 106) with radius 67 then Places a black dot at position (409, 214) then Creates a green rectangular region at (117, 32) spanning 63 by 37 pixels.
; PLAN: r0=363(x), r1=106(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=214(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=117(x), r11=32(y), r12=63(width), r13=37(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 106
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 214
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 117
LDI r11, 32
LDI r12, 63
LDI r13, 37
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
