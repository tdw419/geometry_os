; DESCRIPTION: Composite: Places a green line segment connecting (477, 9) to (386, 95) then Draws a yellow rectangle at (402, 88) with width 34 and height 47.
; PLAN: r0=477(x1), r1=9(y1), r2=386(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=88(y), r7=34(width), r8=47(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 9
LDI r2, 386
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 88
LDI r7, 34
LDI r8, 47
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
