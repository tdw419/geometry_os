; DESCRIPTION: Composite: Draws a red line from (1, 189) to (50, 69) then Sets a single red pixel at (39, 119) then Draws a white rectangle at (270, 198) with width 106 and height 18.
; PLAN: r0=1(x1), r1=189(y1), r2=50(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=119(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=270(x), r11=198(y), r12=106(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 189
LDI r2, 50
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 119
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 270
LDI r11, 198
LDI r12, 106
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
