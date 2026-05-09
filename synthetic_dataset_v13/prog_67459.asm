; DESCRIPTION: Composite: Places a red line segment connecting (423, 125) to (85, 13) then Draws a yellow rectangle at (258, 48) with width 69 and height 16.
; PLAN: r0=423(x1), r1=125(y1), r2=85(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=48(y), r7=69(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 125
LDI r2, 85
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 48
LDI r7, 69
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
