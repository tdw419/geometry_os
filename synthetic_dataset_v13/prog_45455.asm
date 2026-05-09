; DESCRIPTION: Composite: Places a black circle of radius 71 at center (246, 87) then Draws a blue rectangle at (254, 115) with width 74 and height 41 then Draws a yellow line from (395, 151) to (393, 118).
; PLAN: r0=246(x), r1=87(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=115(y), r7=74(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=395(x1), r11=151(y1), r12=393(x2), r13=118(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 87
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 115
LDI r7, 74
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 151
LDI r12, 393
LDI r13, 118
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
