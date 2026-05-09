; DESCRIPTION: Composite: Places a purple 42x16 rectangle at position (196, 64) then Renders a yellow line between points (151, 85) and (138, 48) then Draws a yellow circle centered at (283, 114) with radius 59.
; PLAN: r0=196(x), r1=64(y), r2=42(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x1), r6=85(y1), r7=138(x2), r8=48(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=283(x), r11=114(y), r12=59(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 64
LDI r2, 42
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 85
LDI r7, 138
LDI r8, 48
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 114
LDI r12, 59
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
