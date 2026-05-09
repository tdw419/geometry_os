; DESCRIPTION: Composite: Places a yellow circle of radius 35 at center (259, 160) then Places a magenta 10x119 rectangle at position (181, 128) then Renders a red line between points (288, 63) and (408, 245).
; PLAN: r0=259(x), r1=160(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=128(y), r7=10(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x1), r11=63(y1), r12=408(x2), r13=245(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 160
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 128
LDI r7, 10
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 63
LDI r12, 408
LDI r13, 245
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
