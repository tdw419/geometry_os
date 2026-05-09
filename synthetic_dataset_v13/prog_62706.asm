; DESCRIPTION: Composite: Draws a green line from (204, 93) to (75, 69) then Draws a blue rectangle at (95, 41) with width 95 and height 68.
; PLAN: r0=204(x1), r1=93(y1), r2=75(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=41(y), r7=95(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 93
LDI r2, 75
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 41
LDI r7, 95
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
