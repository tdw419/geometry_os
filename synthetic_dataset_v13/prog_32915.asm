; DESCRIPTION: Composite: Places a green line segment connecting (67, 234) to (42, 238) then Creates a red circular shape at (422, 121) with radius 79 then Creates a white rectangular region at (462, 169) spanning 15 by 24 pixels.
; PLAN: r0=67(x1), r1=234(y1), r2=42(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=121(y), r7=79(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x), r11=169(y), r12=15(width), r13=24(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 234
LDI r2, 42
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 121
LDI r7, 79
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 169
LDI r12, 15
LDI r13, 24
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
