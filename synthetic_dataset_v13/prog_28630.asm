; DESCRIPTION: Composite: Renders a blue line between points (79, 157) and (298, 208) then Draws a green rectangle at (329, 144) with width 119 and height 15.
; PLAN: r0=79(x1), r1=157(y1), r2=298(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=144(y), r7=119(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 157
LDI r2, 298
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 144
LDI r7, 119
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
