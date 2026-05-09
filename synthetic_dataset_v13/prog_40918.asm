; DESCRIPTION: Composite: Places a yellow line segment connecting (488, 254) to (208, 87) then Draws a black rectangle at (287, 118) with width 78 and height 71.
; PLAN: r0=488(x1), r1=254(y1), r2=208(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=118(y), r7=78(width), r8=71(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 488
LDI r1, 254
LDI r2, 208
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 118
LDI r7, 78
LDI r8, 71
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
