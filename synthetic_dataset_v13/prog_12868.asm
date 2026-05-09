; DESCRIPTION: Composite: Draws a black rectangle at (297, 3) with width 55 and height 58 then Renders a red line between points (95, 61) and (22, 121).
; PLAN: r0=297(x), r1=3(y), r2=55(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x1), r6=61(y1), r7=22(x2), r8=121(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 3
LDI r2, 55
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 61
LDI r7, 22
LDI r8, 121
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
