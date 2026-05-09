; DESCRIPTION: Composite: Creates a white rectangular region at (127, 26) spanning 82 by 38 pixels then Creates a yellow circular shape at (377, 134) with radius 77 then Places a green line segment connecting (41, 188) to (222, 238).
; PLAN: r0=127(x), r1=26(y), r2=82(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=134(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x1), r11=188(y1), r12=222(x2), r13=238(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 26
LDI r2, 82
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 134
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 188
LDI r12, 222
LDI r13, 238
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
