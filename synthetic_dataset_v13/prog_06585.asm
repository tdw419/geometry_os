; DESCRIPTION: Composite: Places a purple line segment connecting (309, 245) to (118, 92) then Draws a blue rectangle at (245, 137) with width 61 and height 93.
; PLAN: r0=309(x1), r1=245(y1), r2=118(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=137(y), r7=61(width), r8=93(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 245
LDI r2, 118
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 137
LDI r7, 61
LDI r8, 93
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
