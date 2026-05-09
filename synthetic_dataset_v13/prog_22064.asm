; DESCRIPTION: Composite: Places a white 26x97 rectangle at position (11, 96) then Places a purple dot at position (145, 163) then Places a yellow line segment connecting (134, 146) to (109, 196).
; PLAN: r0=11(x), r1=96(y), r2=26(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=163(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=134(x1), r11=146(y1), r12=109(x2), r13=196(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 96
LDI r2, 26
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 163
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 134
LDI r11, 146
LDI r12, 109
LDI r13, 196
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
