; DESCRIPTION: Composite: Draws a green rectangle at (369, 125) with width 102 and height 37 then Renders a magenta line between points (163, 166) and (85, 62).
; PLAN: r0=369(x), r1=125(y), r2=102(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x1), r6=166(y1), r7=85(x2), r8=62(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 125
LDI r2, 102
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 166
LDI r7, 85
LDI r8, 62
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
