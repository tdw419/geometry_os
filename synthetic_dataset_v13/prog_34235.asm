; DESCRIPTION: Composite: Draws a green line from (424, 74) to (419, 136) then Draws a blue rectangle at (162, 60) with width 36 and height 79 then Sets a single black pixel at (474, 194).
; PLAN: r0=424(x1), r1=74(y1), r2=419(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=60(y), r7=36(width), r8=79(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=474(x), r11=194(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 74
LDI r2, 419
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 60
LDI r7, 36
LDI r8, 79
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 194
LDI r12, 0x000000
PSET r10, r11, r12
HALT
