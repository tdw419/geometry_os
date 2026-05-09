; DESCRIPTION: Composite: Creates a red circular shape at (342, 100) with radius 58 then Renders a yellow line between points (48, 171) and (491, 212) then Creates a black rectangular region at (421, 206) spanning 40 by 50 pixels.
; PLAN: r0=342(x), r1=100(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x1), r6=171(y1), r7=491(x2), r8=212(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=206(y), r12=40(width), r13=50(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 100
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 171
LDI r7, 491
LDI r8, 212
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 206
LDI r12, 40
LDI r13, 50
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
