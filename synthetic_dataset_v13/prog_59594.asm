; DESCRIPTION: Composite: Renders a magenta line between points (185, 142) and (465, 248) then Draws a green rectangle at (52, 51) with width 44 and height 96.
; PLAN: r0=185(x1), r1=142(y1), r2=465(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=51(y), r7=44(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 142
LDI r2, 465
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 51
LDI r7, 44
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
