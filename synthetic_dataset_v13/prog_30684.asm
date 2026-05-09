; DESCRIPTION: Composite: Renders a blue line between points (440, 247) and (99, 171) then Draws a magenta rectangle at (37, 5) with width 36 and height 104.
; PLAN: r0=440(x1), r1=247(y1), r2=99(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=5(y), r7=36(width), r8=104(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 247
LDI r2, 99
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 5
LDI r7, 36
LDI r8, 104
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
