; DESCRIPTION: Composite: Draws a blue rectangle at (346, 132) with width 19 and height 102 then Places a red line segment connecting (322, 94) to (69, 248).
; PLAN: r0=346(x), r1=132(y), r2=19(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x1), r6=94(y1), r7=69(x2), r8=248(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 132
LDI r2, 19
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 94
LDI r7, 69
LDI r8, 248
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
