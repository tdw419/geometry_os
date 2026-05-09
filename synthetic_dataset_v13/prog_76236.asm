; DESCRIPTION: Composite: Places a blue line segment connecting (424, 170) to (225, 65) then Draws a white circle centered at (196, 128) with radius 61 then Renders a purple box of size 96x71 starting at (227, 162).
; PLAN: r0=424(x1), r1=170(y1), r2=225(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=128(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=227(x), r11=162(y), r12=96(width), r13=71(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 170
LDI r2, 225
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 128
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 227
LDI r11, 162
LDI r12, 96
LDI r13, 71
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
