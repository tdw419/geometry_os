; DESCRIPTION: Composite: Places a cyan line segment connecting (464, 151) to (499, 170) then Draws a black rectangle at (241, 52) with width 105 and height 119.
; PLAN: r0=464(x1), r1=151(y1), r2=499(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=52(y), r7=105(width), r8=119(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 151
LDI r2, 499
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 52
LDI r7, 105
LDI r8, 119
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
