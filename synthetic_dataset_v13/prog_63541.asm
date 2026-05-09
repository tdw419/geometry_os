; DESCRIPTION: Composite: Draws a magenta rectangle at (185, 129) with width 15 and height 118 then Places a black line segment connecting (52, 171) to (3, 83).
; PLAN: r0=185(x), r1=129(y), r2=15(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x1), r6=171(y1), r7=3(x2), r8=83(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 129
LDI r2, 15
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 171
LDI r7, 3
LDI r8, 83
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
