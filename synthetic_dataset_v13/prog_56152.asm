; DESCRIPTION: Composite: Places a magenta circle of radius 13 at center (453, 144) then Draws a green rectangle at (251, 133) with width 100 and height 94.
; PLAN: r0=453(x), r1=144(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=133(y), r7=100(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 144
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 133
LDI r7, 100
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
