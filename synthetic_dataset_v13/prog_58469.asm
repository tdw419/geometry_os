; DESCRIPTION: Composite: Draws a magenta rectangle at (87, 130) with width 102 and height 24 then Draws a white line from (57, 251) to (185, 230).
; PLAN: r0=87(x), r1=130(y), r2=102(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x1), r6=251(y1), r7=185(x2), r8=230(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 130
LDI r2, 102
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 251
LDI r7, 185
LDI r8, 230
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
