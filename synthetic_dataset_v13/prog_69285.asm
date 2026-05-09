; DESCRIPTION: Composite: Places a red line segment connecting (10, 238) to (267, 69) then Sets a single black pixel at (360, 11) then Draws a red rectangle at (2, 34) with width 86 and height 113.
; PLAN: r0=10(x1), r1=238(y1), r2=267(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=11(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=2(x), r11=34(y), r12=86(width), r13=113(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 238
LDI r2, 267
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 11
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 2
LDI r11, 34
LDI r12, 86
LDI r13, 113
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
