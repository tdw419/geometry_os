; DESCRIPTION: Composite: Creates a magenta rectangular region at (139, 19) spanning 44 by 93 pixels then Places a cyan line segment connecting (290, 41) to (157, 136) then Renders a black disk with center (169, 94) and radius 53.
; PLAN: r0=139(x), r1=19(y), r2=44(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=41(y1), r7=157(x2), r8=136(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=94(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 139
LDI r1, 19
LDI r2, 44
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 41
LDI r7, 157
LDI r8, 136
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 94
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
