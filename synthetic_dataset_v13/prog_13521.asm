; DESCRIPTION: Composite: Draws a green rectangle at (217, 199) with width 28 and height 11 then Places a green line segment connecting (259, 84) to (52, 210).
; PLAN: r0=217(x), r1=199(y), r2=28(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x1), r6=84(y1), r7=52(x2), r8=210(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 199
LDI r2, 28
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 84
LDI r7, 52
LDI r8, 210
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
