; DESCRIPTION: Composite: Places a cyan line segment connecting (49, 108) to (481, 10) then Renders a cyan box of size 40x118 starting at (318, 120) then Draws a white circle centered at (125, 134) with radius 72.
; PLAN: r0=49(x1), r1=108(y1), r2=481(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=120(y), r7=40(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=125(x), r11=134(y), r12=72(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 108
LDI r2, 481
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 120
LDI r7, 40
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 134
LDI r12, 72
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
