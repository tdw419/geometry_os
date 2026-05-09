; DESCRIPTION: Composite: Renders a magenta line between points (376, 141) and (106, 49) then Draws a cyan rectangle at (309, 136) with width 85 and height 53.
; PLAN: r0=376(x1), r1=141(y1), r2=106(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=136(y), r7=85(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 141
LDI r2, 106
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 136
LDI r7, 85
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
