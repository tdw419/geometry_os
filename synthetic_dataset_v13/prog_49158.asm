; DESCRIPTION: Composite: Draws a red line from (350, 148) to (481, 69) then Draws a magenta rectangle at (193, 65) with width 12 and height 47.
; PLAN: r0=350(x1), r1=148(y1), r2=481(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=65(y), r7=12(width), r8=47(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 148
LDI r2, 481
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 65
LDI r7, 12
LDI r8, 47
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
