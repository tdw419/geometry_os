; DESCRIPTION: Composite: Draws a green circle centered at (121, 58) with radius 41 then Renders a green box of size 90x47 starting at (165, 102) then Draws a yellow line from (53, 226) to (273, 99).
; PLAN: r0=121(x), r1=58(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=102(y), r7=90(width), r8=47(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x1), r11=226(y1), r12=273(x2), r13=99(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 58
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 102
LDI r7, 90
LDI r8, 47
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 226
LDI r12, 273
LDI r13, 99
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
