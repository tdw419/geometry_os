; DESCRIPTION: Composite: Draws a magenta rectangle at (295, 139) with width 94 and height 70 then Places a green line segment connecting (396, 111) to (185, 9).
; PLAN: r0=295(x), r1=139(y), r2=94(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x1), r6=111(y1), r7=185(x2), r8=9(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 139
LDI r2, 94
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 111
LDI r7, 185
LDI r8, 9
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
