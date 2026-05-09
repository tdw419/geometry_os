; DESCRIPTION: Composite: Renders a magenta disk with center (97, 121) and radius 47 then Renders a blue line between points (411, 150) and (117, 50) then Draws a white rectangle at (198, 31) with width 25 and height 77.
; PLAN: r0=97(x), r1=121(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=150(y1), r7=117(x2), r8=50(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=31(y), r12=25(width), r13=77(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 121
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 150
LDI r7, 117
LDI r8, 50
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 31
LDI r12, 25
LDI r13, 77
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
