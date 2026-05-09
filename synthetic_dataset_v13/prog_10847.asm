; DESCRIPTION: Composite: Draws a yellow rectangle at (149, 2) with width 95 and height 74 then Places a white line segment connecting (93, 150) to (42, 22).
; PLAN: r0=149(x), r1=2(y), r2=95(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x1), r6=150(y1), r7=42(x2), r8=22(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 2
LDI r2, 95
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 150
LDI r7, 42
LDI r8, 22
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
