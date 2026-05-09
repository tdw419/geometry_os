; DESCRIPTION: Composite: Draws a magenta rectangle at (436, 99) with width 28 and height 91 then Renders a blue line between points (9, 240) and (419, 90).
; PLAN: r0=436(x), r1=99(y), r2=28(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=240(y1), r7=419(x2), r8=90(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 99
LDI r2, 28
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 240
LDI r7, 419
LDI r8, 90
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
