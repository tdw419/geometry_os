; DESCRIPTION: Composite: Places a purple line segment connecting (91, 31) to (493, 217) then Places a white circle of radius 57 at center (305, 122) then Creates a magenta rectangular region at (262, 44) spanning 30 by 22 pixels.
; PLAN: r0=91(x1), r1=31(y1), r2=493(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=122(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x), r11=44(y), r12=30(width), r13=22(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 31
LDI r2, 493
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 122
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 44
LDI r12, 30
LDI r13, 22
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
