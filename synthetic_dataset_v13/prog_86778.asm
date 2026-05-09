; DESCRIPTION: Composite: Draws a orange circle centered at (453, 64) with radius 11 then Places a orange dot at position (206, 103) then Creates a cyan rectangular region at (105, 20) spanning 57 by 19 pixels.
; PLAN: r0=453(x), r1=64(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=103(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=105(x), r11=20(y), r12=57(width), r13=19(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 64
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 103
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 105
LDI r11, 20
LDI r12, 57
LDI r13, 19
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
