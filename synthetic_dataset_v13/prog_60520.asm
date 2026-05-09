; DESCRIPTION: Composite: Places a blue line segment connecting (59, 29) to (339, 213) then Creates a blue circular shape at (346, 61) with radius 52 then Creates a magenta rectangular region at (21, 135) spanning 96 by 117 pixels.
; PLAN: r0=59(x1), r1=29(y1), r2=339(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=61(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x), r11=135(y), r12=96(width), r13=117(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 29
LDI r2, 339
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 61
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 135
LDI r12, 96
LDI r13, 117
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
