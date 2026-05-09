; DESCRIPTION: Composite: Renders a magenta box of size 118x84 starting at (305, 145) then Places a blue line segment connecting (483, 145) to (207, 184).
; PLAN: r0=305(x), r1=145(y), r2=118(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=145(y1), r7=207(x2), r8=184(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 145
LDI r2, 118
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 145
LDI r7, 207
LDI r8, 184
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
