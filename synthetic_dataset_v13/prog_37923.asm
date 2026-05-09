; DESCRIPTION: Composite: Draws a black line from (69, 184) to (360, 171) then Draws a magenta rectangle at (106, 113) with width 118 and height 16.
; PLAN: r0=69(x1), r1=184(y1), r2=360(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=113(y), r7=118(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 184
LDI r2, 360
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 113
LDI r7, 118
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
