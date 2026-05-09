; DESCRIPTION: Composite: Draws a white rectangle at (28, 169) with width 55 and height 77 then Places a black dot at position (456, 19) then Places a yellow line segment connecting (505, 250) to (181, 117).
; PLAN: r0=28(x), r1=169(y), r2=55(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=19(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=505(x1), r11=250(y1), r12=181(x2), r13=117(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 169
LDI r2, 55
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 19
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 505
LDI r11, 250
LDI r12, 181
LDI r13, 117
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
