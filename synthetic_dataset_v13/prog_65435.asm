; DESCRIPTION: Composite: Draws a yellow rectangle at (434, 112) with width 11 and height 64 then Places a white circle of radius 69 at center (131, 70) then Renders a magenta line between points (204, 62) and (440, 96).
; PLAN: r0=434(x), r1=112(y), r2=11(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=70(y), r7=69(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x1), r11=62(y1), r12=440(x2), r13=96(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 112
LDI r2, 11
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 70
LDI r7, 69
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 62
LDI r12, 440
LDI r13, 96
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
