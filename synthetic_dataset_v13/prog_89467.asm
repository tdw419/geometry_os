; DESCRIPTION: Composite: Renders a blue line between points (135, 66) and (413, 132) then Sets a single black pixel at (28, 96) then Creates a white rectangular region at (213, 100) spanning 26 by 114 pixels.
; PLAN: r0=135(x1), r1=66(y1), r2=413(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=28(x), r6=96(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=213(x), r11=100(y), r12=26(width), r13=114(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 66
LDI r2, 413
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 96
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 213
LDI r11, 100
LDI r12, 26
LDI r13, 114
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
