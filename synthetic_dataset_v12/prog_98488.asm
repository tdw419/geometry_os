; DESCRIPTION: Composite: Places a purple 74x15 rectangle at position (123, 99) then Renders a green line between points (224, 116) and (222, 114) then Places a red circle of radius 29 at center (59, 125).
; PLAN: r0=123(x), r1=99(y), r2=74(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x1), r6=116(y1), r7=222(x2), r8=114(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=125(y), r12=29(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 123
LDI r1, 99
LDI r2, 74
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 116
LDI r7, 222
LDI r8, 114
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 125
LDI r12, 29
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
