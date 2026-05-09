; DESCRIPTION: Composite: Draws a blue rectangle at (451, 149) with width 35 and height 97 then Places a blue line segment connecting (140, 42) to (452, 31).
; PLAN: r0=451(x), r1=149(y), r2=35(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x1), r6=42(y1), r7=452(x2), r8=31(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 149
LDI r2, 35
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 42
LDI r7, 452
LDI r8, 31
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
