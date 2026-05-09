; DESCRIPTION: Composite: Draws a orange line from (36, 107) to (501, 30) then Places a green circle of radius 54 at center (356, 72) then Places a red 101x119 rectangle at position (239, 133).
; PLAN: r0=36(x1), r1=107(y1), r2=501(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=72(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x), r11=133(y), r12=101(width), r13=119(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 107
LDI r2, 501
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 72
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 133
LDI r12, 101
LDI r13, 119
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
