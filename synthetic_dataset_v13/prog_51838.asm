; DESCRIPTION: Composite: Places a white circle of radius 59 at center (149, 141) then Draws a cyan rectangle at (249, 41) with width 75 and height 29 then Places a red line segment connecting (481, 222) to (363, 35).
; PLAN: r0=149(x), r1=141(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=41(y), r7=75(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=481(x1), r11=222(y1), r12=363(x2), r13=35(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 141
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 41
LDI r7, 75
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 222
LDI r12, 363
LDI r13, 35
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
