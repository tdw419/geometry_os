; DESCRIPTION: Composite: Draws a white line from (69, 99) to (1, 238) then Places a magenta circle of radius 52 at center (102, 163) then Places a orange 119x67 rectangle at position (200, 51).
; PLAN: r0=69(x1), r1=99(y1), r2=1(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=163(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x), r11=51(y), r12=119(width), r13=67(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 99
LDI r2, 1
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 163
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 51
LDI r12, 119
LDI r13, 67
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
