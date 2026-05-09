; DESCRIPTION: Composite: Renders a black disk with center (184, 115) and radius 42 then Places a green line segment connecting (200, 138) to (315, 252) then Draws a white rectangle at (38, 95) with width 93 and height 29.
; PLAN: r0=184(x), r1=115(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=138(y1), r7=315(x2), r8=252(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=38(x), r11=95(y), r12=93(width), r13=29(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 115
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 138
LDI r7, 315
LDI r8, 252
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 95
LDI r12, 93
LDI r13, 29
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
