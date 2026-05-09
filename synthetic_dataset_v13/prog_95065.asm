; DESCRIPTION: Composite: Draws a white line from (240, 199) to (282, 99) then Draws a magenta rectangle at (91, 79) with width 38 and height 66.
; PLAN: r0=240(x1), r1=199(y1), r2=282(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=79(y), r7=38(width), r8=66(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 199
LDI r2, 282
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 79
LDI r7, 38
LDI r8, 66
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
