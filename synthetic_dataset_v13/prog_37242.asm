; DESCRIPTION: Composite: Draws a magenta rectangle at (408, 85) with width 16 and height 67 then Places a blue line segment connecting (467, 145) to (136, 212).
; PLAN: r0=408(x), r1=85(y), r2=16(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x1), r6=145(y1), r7=136(x2), r8=212(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 85
LDI r2, 16
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 145
LDI r7, 136
LDI r8, 212
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
