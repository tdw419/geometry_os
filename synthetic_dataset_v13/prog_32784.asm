; DESCRIPTION: Composite: Draws a white rectangle at (161, 25) with width 57 and height 78 then Renders a purple line between points (250, 178) and (37, 165).
; PLAN: r0=161(x), r1=25(y), r2=57(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=250(x1), r6=178(y1), r7=37(x2), r8=165(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 25
LDI r2, 57
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 178
LDI r7, 37
LDI r8, 165
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
