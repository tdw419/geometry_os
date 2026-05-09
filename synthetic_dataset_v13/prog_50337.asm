; DESCRIPTION: Composite: Draws a cyan rectangle at (94, 84) with width 105 and height 11 then Places a green line segment connecting (270, 45) to (125, 105).
; PLAN: r0=94(x), r1=84(y), r2=105(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x1), r6=45(y1), r7=125(x2), r8=105(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 84
LDI r2, 105
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 45
LDI r7, 125
LDI r8, 105
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
