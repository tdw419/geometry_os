; DESCRIPTION: Composite: Sets a single white pixel at (353, 11) then Draws a blue line from (137, 250) to (168, 57) then Draws a black rectangle at (215, 136) with width 75 and height 105.
; PLAN: r0=353(x), r1=11(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=137(x1), r6=250(y1), r7=168(x2), r8=57(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=136(y), r12=75(width), r13=105(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 353
LDI r1, 11
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 137
LDI r6, 250
LDI r7, 168
LDI r8, 57
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 136
LDI r12, 75
LDI r13, 105
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
