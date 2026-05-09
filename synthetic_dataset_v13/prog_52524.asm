; DESCRIPTION: Composite: Draws a white line from (88, 110) to (314, 155) then Sets a single magenta pixel at (168, 88) then Places a green 20x83 rectangle at position (288, 17).
; PLAN: r0=88(x1), r1=110(y1), r2=314(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=88(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=17(y), r12=20(width), r13=83(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 110
LDI r2, 314
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 88
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 288
LDI r11, 17
LDI r12, 20
LDI r13, 83
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
