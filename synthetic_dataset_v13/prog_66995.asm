; DESCRIPTION: Composite: Draws a blue rectangle at (57, 18) with width 116 and height 84 then Places a red circle of radius 57 at center (433, 76) then Places a cyan line segment connecting (337, 102) to (155, 15).
; PLAN: r0=57(x), r1=18(y), r2=116(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=76(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x1), r11=102(y1), r12=155(x2), r13=15(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 18
LDI r2, 116
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 76
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 102
LDI r12, 155
LDI r13, 15
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
