; DESCRIPTION: Composite: Creates a magenta rectangular region at (2, 135) spanning 92 by 59 pixels then Places a yellow dot at position (227, 72) then Places a white line segment connecting (36, 36) to (278, 251).
; PLAN: r0=2(x), r1=135(y), r2=92(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=72(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=36(x1), r11=36(y1), r12=278(x2), r13=251(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 135
LDI r2, 92
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 72
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 36
LDI r11, 36
LDI r12, 278
LDI r13, 251
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
