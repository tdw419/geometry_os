; DESCRIPTION: Composite: Draws a red rectangle at (300, 95) with width 94 and height 110 then Places a blue line segment connecting (362, 234) to (338, 166).
; PLAN: r0=300(x), r1=95(y), r2=94(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x1), r6=234(y1), r7=338(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 95
LDI r2, 94
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 234
LDI r7, 338
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
