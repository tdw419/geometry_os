; DESCRIPTION: Composite: Draws a black circle centered at (437, 59) with radius 57 then Sets a single red pixel at (138, 153) then Creates a magenta rectangular region at (141, 110) spanning 22 by 120 pixels.
; PLAN: r0=437(x), r1=59(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=153(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=141(x), r11=110(y), r12=22(width), r13=120(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 59
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 153
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 141
LDI r11, 110
LDI r12, 22
LDI r13, 120
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
