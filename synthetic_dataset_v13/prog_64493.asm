; DESCRIPTION: Composite: Renders a blue line between points (289, 60) and (132, 175) then Draws a black rectangle at (261, 68) with width 108 and height 72.
; PLAN: r0=289(x1), r1=60(y1), r2=132(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=68(y), r7=108(width), r8=72(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 60
LDI r2, 132
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 68
LDI r7, 108
LDI r8, 72
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
