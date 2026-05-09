; DESCRIPTION: Composite: Draws a blue rectangle at (181, 74) with width 64 and height 107 then Renders a purple line between points (21, 186) and (235, 241).
; PLAN: r0=181(x), r1=74(y), r2=64(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=186(y1), r7=235(x2), r8=241(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 74
LDI r2, 64
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 186
LDI r7, 235
LDI r8, 241
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
