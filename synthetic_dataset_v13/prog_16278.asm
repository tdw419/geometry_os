; DESCRIPTION: Composite: Places a red 101x76 rectangle at position (282, 49) then Places a red circle of radius 38 at center (158, 129) then Places a green line segment connecting (342, 222) to (159, 187).
; PLAN: r0=282(x), r1=49(y), r2=101(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=129(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x1), r11=222(y1), r12=159(x2), r13=187(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 49
LDI r2, 101
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 129
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 222
LDI r12, 159
LDI r13, 187
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
