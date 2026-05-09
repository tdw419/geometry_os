; DESCRIPTION: Composite: Draws a green rectangle at (35, 69) with width 30 and height 66 then Renders a blue line between points (241, 130) and (336, 95).
; PLAN: r0=35(x), r1=69(y), r2=30(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x1), r6=130(y1), r7=336(x2), r8=95(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 69
LDI r2, 30
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 130
LDI r7, 336
LDI r8, 95
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
