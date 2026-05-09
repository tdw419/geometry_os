; DESCRIPTION: Composite: Draws a black rectangle at (114, 89) with width 55 and height 30 then Renders a white line between points (385, 91) and (511, 162).
; PLAN: r0=114(x), r1=89(y), r2=55(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x1), r6=91(y1), r7=511(x2), r8=162(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 89
LDI r2, 55
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 91
LDI r7, 511
LDI r8, 162
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
