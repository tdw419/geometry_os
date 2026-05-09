; DESCRIPTION: Composite: Places a purple dot at position (15, 56) then Renders a orange disk with center (110, 39) and radius 21 then Creates a blue rectangular region at (217, 66) spanning 57 by 108 pixels.
; PLAN: r0=15(x), r1=56(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=39(y), r7=21(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=66(y), r12=57(width), r13=108(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 56
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 39
LDI r7, 21
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 66
LDI r12, 57
LDI r13, 108
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
