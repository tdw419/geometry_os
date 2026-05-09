; DESCRIPTION: Composite: Places a green 72x61 rectangle at position (26, 78) then Draws a magenta circle centered at (212, 87) with radius 45 then Renders a green line between points (158, 48) and (108, 232).
; PLAN: r0=26(x), r1=78(y), r2=72(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x), r6=87(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x1), r11=48(y1), r12=108(x2), r13=232(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 78
LDI r2, 72
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 87
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 48
LDI r12, 108
LDI r13, 232
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
