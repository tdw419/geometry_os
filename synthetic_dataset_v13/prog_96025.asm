; DESCRIPTION: Composite: Draws a blue line from (386, 201) to (333, 78) then Places a white circle of radius 53 at center (253, 120) then Creates a orange rectangular region at (225, 106) spanning 108 by 58 pixels.
; PLAN: r0=386(x1), r1=201(y1), r2=333(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=120(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=225(x), r11=106(y), r12=108(width), r13=58(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 201
LDI r2, 333
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 120
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 225
LDI r11, 106
LDI r12, 108
LDI r13, 58
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
