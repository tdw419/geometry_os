; DESCRIPTION: Composite: Places a blue line segment connecting (369, 23) to (73, 62) then Draws a magenta rectangle at (338, 191) with width 90 and height 27.
; PLAN: r0=369(x1), r1=23(y1), r2=73(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=191(y), r7=90(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 23
LDI r2, 73
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 191
LDI r7, 90
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
