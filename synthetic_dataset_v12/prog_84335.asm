; DESCRIPTION: Composite: Places a purple circle of radius 80 at center (337, 81) then Draws a yellow rectangle at (236, 31) with width 52 and height 47.
; PLAN: r0=337(x), r1=81(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=31(y), r7=52(width), r8=47(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 81
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 31
LDI r7, 52
LDI r8, 47
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
