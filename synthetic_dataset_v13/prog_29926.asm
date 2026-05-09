; DESCRIPTION: Composite: Renders a blue line between points (139, 165) and (404, 209) then Draws a purple rectangle at (181, 72) with width 78 and height 98.
; PLAN: r0=139(x1), r1=165(y1), r2=404(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=72(y), r7=78(width), r8=98(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 165
LDI r2, 404
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 72
LDI r7, 78
LDI r8, 98
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
