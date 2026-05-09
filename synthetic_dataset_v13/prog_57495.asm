; DESCRIPTION: Composite: Renders a blue box of size 54x113 starting at (120, 81) then Draws a orange line from (356, 199) to (440, 84).
; PLAN: r0=120(x), r1=81(y), r2=54(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=199(y1), r7=440(x2), r8=84(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 81
LDI r2, 54
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 199
LDI r7, 440
LDI r8, 84
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
