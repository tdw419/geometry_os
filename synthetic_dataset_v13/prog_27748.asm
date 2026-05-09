; DESCRIPTION: Composite: Places a purple line segment connecting (122, 118) to (480, 13) then Draws a white rectangle at (257, 177) with width 54 and height 74.
; PLAN: r0=122(x1), r1=118(y1), r2=480(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=177(y), r7=54(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 122
LDI r1, 118
LDI r2, 480
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 177
LDI r7, 54
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
