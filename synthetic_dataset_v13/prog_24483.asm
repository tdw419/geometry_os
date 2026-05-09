; DESCRIPTION: Composite: Renders a cyan line between points (15, 102) and (223, 92) then Draws a blue rectangle at (408, 49) with width 55 and height 57 then Draws a black circle centered at (356, 134) with radius 34.
; PLAN: r0=15(x1), r1=102(y1), r2=223(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=49(y), r7=55(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=134(y), r12=34(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 102
LDI r2, 223
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 49
LDI r7, 55
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 134
LDI r12, 34
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
