; DESCRIPTION: Composite: Places a blue 85x87 rectangle at position (288, 168) then Places a magenta circle of radius 63 at center (161, 86) then Renders a purple line between points (53, 245) and (147, 74).
; PLAN: r0=288(x), r1=168(y), r2=85(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=86(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x1), r11=245(y1), r12=147(x2), r13=74(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 168
LDI r2, 85
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 86
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 245
LDI r12, 147
LDI r13, 74
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
