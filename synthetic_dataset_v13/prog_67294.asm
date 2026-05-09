; DESCRIPTION: Composite: Places a cyan line segment connecting (478, 204) to (429, 110) then Creates a red circular shape at (62, 69) with radius 24 then Draws a yellow rectangle at (387, 171) with width 29 and height 13.
; PLAN: r0=478(x1), r1=204(y1), r2=429(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=69(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x), r11=171(y), r12=29(width), r13=13(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 204
LDI r2, 429
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 69
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 171
LDI r12, 29
LDI r13, 13
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
