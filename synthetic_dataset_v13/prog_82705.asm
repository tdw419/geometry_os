; DESCRIPTION: Composite: Renders a red line between points (464, 241) and (193, 200) then Renders a blue box of size 113x24 starting at (312, 76) then Places a white circle of radius 14 at center (102, 41).
; PLAN: r0=464(x1), r1=241(y1), r2=193(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=76(y), r7=113(width), r8=24(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=41(y), r12=14(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 241
LDI r2, 193
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 76
LDI r7, 113
LDI r8, 24
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 41
LDI r12, 14
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
