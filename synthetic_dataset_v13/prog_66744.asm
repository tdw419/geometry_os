; DESCRIPTION: Composite: Renders a blue line between points (209, 125) and (379, 74) then Draws a magenta circle centered at (62, 77) with radius 44 then Draws a white rectangle at (217, 51) with width 24 and height 29.
; PLAN: r0=209(x1), r1=125(y1), r2=379(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=77(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=51(y), r12=24(width), r13=29(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 125
LDI r2, 379
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 77
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 51
LDI r12, 24
LDI r13, 29
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
