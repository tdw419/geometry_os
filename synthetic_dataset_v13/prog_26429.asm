; DESCRIPTION: Composite: Draws a blue rectangle at (312, 44) with width 15 and height 16 then Renders a blue line between points (122, 65) and (366, 38).
; PLAN: r0=312(x), r1=44(y), r2=15(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=65(y1), r7=366(x2), r8=38(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 44
LDI r2, 15
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 65
LDI r7, 366
LDI r8, 38
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
