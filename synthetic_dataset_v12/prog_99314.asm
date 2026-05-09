; DESCRIPTION: Composite: Places a green line segment connecting (426, 158) to (251, 69) then Draws a yellow rectangle at (111, 34) with width 12 and height 79 then Places a cyan dot at position (276, 116).
; PLAN: r0=426(x1), r1=158(y1), r2=251(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=34(y), r7=12(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x), r11=116(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 158
LDI r2, 251
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 34
LDI r7, 12
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 116
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
