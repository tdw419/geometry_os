; DESCRIPTION: Composite: Places a purple circle of radius 19 at center (86, 204) then Places a blue dot at position (510, 241) then Creates a orange rectangular region at (180, 70) spanning 88 by 72 pixels.
; PLAN: r0=86(x), r1=204(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x), r6=241(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=70(y), r12=88(width), r13=72(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 204
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 241
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 70
LDI r12, 88
LDI r13, 72
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
