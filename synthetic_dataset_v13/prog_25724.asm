; DESCRIPTION: Composite: Draws a cyan rectangle at (250, 1) with width 39 and height 106 then Places a cyan line segment connecting (195, 250) to (252, 62).
; PLAN: r0=250(x), r1=1(y), r2=39(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x1), r6=250(y1), r7=252(x2), r8=62(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 1
LDI r2, 39
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 250
LDI r7, 252
LDI r8, 62
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
