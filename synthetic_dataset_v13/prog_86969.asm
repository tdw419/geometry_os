; DESCRIPTION: Composite: Places a purple line segment connecting (354, 252) to (7, 248) then Draws a blue rectangle at (420, 25) with width 17 and height 52.
; PLAN: r0=354(x1), r1=252(y1), r2=7(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=25(y), r7=17(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 252
LDI r2, 7
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 25
LDI r7, 17
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
