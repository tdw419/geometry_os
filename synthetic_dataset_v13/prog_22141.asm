; DESCRIPTION: Composite: Places a orange dot at position (422, 30) then Draws a yellow circle centered at (387, 135) with radius 28 then Creates a blue rectangular region at (190, 158) spanning 38 by 62 pixels.
; PLAN: r0=422(x), r1=30(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=135(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x), r11=158(y), r12=38(width), r13=62(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 30
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 387
LDI r6, 135
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 158
LDI r12, 38
LDI r13, 62
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
