; DESCRIPTION: Composite: Renders a cyan line between points (246, 70) and (342, 72) then Draws a white circle centered at (317, 97) with radius 27 then Draws a yellow rectangle at (469, 113) with width 25 and height 23.
; PLAN: r0=246(x1), r1=70(y1), r2=342(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=97(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x), r11=113(y), r12=25(width), r13=23(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 70
LDI r2, 342
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 97
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 113
LDI r12, 25
LDI r13, 23
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
