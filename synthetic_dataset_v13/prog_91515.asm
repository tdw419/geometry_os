; DESCRIPTION: Composite: Draws a magenta rectangle at (374, 122) with width 110 and height 114 then Places a blue line segment connecting (31, 221) to (387, 200).
; PLAN: r0=374(x), r1=122(y), r2=110(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x1), r6=221(y1), r7=387(x2), r8=200(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 122
LDI r2, 110
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 221
LDI r7, 387
LDI r8, 200
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
