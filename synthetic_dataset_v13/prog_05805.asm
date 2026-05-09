; DESCRIPTION: Composite: Places a green line segment connecting (139, 166) to (207, 235) then Draws a purple rectangle at (256, 67) with width 41 and height 88.
; PLAN: r0=139(x1), r1=166(y1), r2=207(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=67(y), r7=41(width), r8=88(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 166
LDI r2, 207
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 67
LDI r7, 41
LDI r8, 88
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
