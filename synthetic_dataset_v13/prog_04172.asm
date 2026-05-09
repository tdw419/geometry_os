; DESCRIPTION: Composite: Renders a yellow line between points (121, 178) and (424, 251) then Draws a magenta rectangle at (444, 29) with width 35 and height 35.
; PLAN: r0=121(x1), r1=178(y1), r2=424(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=29(y), r7=35(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 178
LDI r2, 424
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 29
LDI r7, 35
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
