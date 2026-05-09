; DESCRIPTION: Composite: Places a magenta circle of radius 17 at center (350, 199) then Places a blue 100x61 rectangle at position (310, 180) then Draws a red line from (486, 160) to (485, 53).
; PLAN: r0=350(x), r1=199(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=180(y), r7=100(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=486(x1), r11=160(y1), r12=485(x2), r13=53(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 199
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 180
LDI r7, 100
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 160
LDI r12, 485
LDI r13, 53
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
