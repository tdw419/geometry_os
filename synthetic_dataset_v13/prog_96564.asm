; DESCRIPTION: Composite: Renders a black line between points (138, 126) and (475, 246) then Creates a cyan rectangular region at (103, 74) spanning 26 by 71 pixels then Creates a white circular shape at (86, 181) with radius 25.
; PLAN: r0=138(x1), r1=126(y1), r2=475(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=74(y), r7=26(width), r8=71(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x), r11=181(y), r12=25(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 126
LDI r2, 475
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 74
LDI r7, 26
LDI r8, 71
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 181
LDI r12, 25
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
