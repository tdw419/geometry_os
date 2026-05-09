; DESCRIPTION: Composite: Renders a white line between points (114, 115) and (48, 8) then Sets a single magenta pixel at (306, 104) then Draws a blue rectangle at (189, 188) with width 96 and height 47.
; PLAN: r0=114(x1), r1=115(y1), r2=48(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=104(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=188(y), r12=96(width), r13=47(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 115
LDI r2, 48
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 104
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 189
LDI r11, 188
LDI r12, 96
LDI r13, 47
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
