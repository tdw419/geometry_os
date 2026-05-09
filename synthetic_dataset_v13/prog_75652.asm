; DESCRIPTION: Composite: Draws a magenta rectangle at (250, 8) with width 20 and height 18 then Renders a blue line between points (30, 32) and (130, 205).
; PLAN: r0=250(x), r1=8(y), r2=20(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x1), r6=32(y1), r7=130(x2), r8=205(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 8
LDI r2, 20
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 32
LDI r7, 130
LDI r8, 205
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
