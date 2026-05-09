; DESCRIPTION: Composite: Renders a black line between points (244, 91) and (416, 251) then Renders a blue box of size 77x101 starting at (246, 93).
; PLAN: r0=244(x1), r1=91(y1), r2=416(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=93(y), r7=77(width), r8=101(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 91
LDI r2, 416
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 93
LDI r7, 77
LDI r8, 101
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
