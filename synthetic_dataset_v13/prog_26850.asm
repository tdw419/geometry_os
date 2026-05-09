; DESCRIPTION: Composite: Draws a red rectangle at (119, 54) with width 101 and height 49 then Renders a blue line between points (486, 21) and (345, 168).
; PLAN: r0=119(x), r1=54(y), r2=101(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x1), r6=21(y1), r7=345(x2), r8=168(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 54
LDI r2, 101
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 21
LDI r7, 345
LDI r8, 168
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
