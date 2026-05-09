; DESCRIPTION: Composite: Draws a magenta rectangle at (4, 64) with width 100 and height 30 then Renders a white line between points (70, 210) and (271, 203) then Places a yellow circle of radius 51 at center (185, 61).
; PLAN: r0=4(x), r1=64(y), r2=100(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x1), r6=210(y1), r7=271(x2), r8=203(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=185(x), r11=61(y), r12=51(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 4
LDI r1, 64
LDI r2, 100
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 210
LDI r7, 271
LDI r8, 203
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 61
LDI r12, 51
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
