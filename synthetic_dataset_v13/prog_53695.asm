; DESCRIPTION: Composite: Places a purple circle of radius 20 at center (233, 124) then Draws a green rectangle at (70, 81) with width 101 and height 79 then Places a cyan line segment connecting (134, 202) to (31, 56).
; PLAN: r0=233(x), r1=124(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=81(y), r7=101(width), r8=79(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x1), r11=202(y1), r12=31(x2), r13=56(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 124
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 81
LDI r7, 101
LDI r8, 79
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 202
LDI r12, 31
LDI r13, 56
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
