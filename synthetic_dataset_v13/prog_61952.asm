; DESCRIPTION: Composite: Draws a green rectangle at (125, 123) with width 30 and height 48 then Places a magenta line segment connecting (140, 172) to (294, 137).
; PLAN: r0=125(x), r1=123(y), r2=30(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x1), r6=172(y1), r7=294(x2), r8=137(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 123
LDI r2, 30
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 172
LDI r7, 294
LDI r8, 137
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
