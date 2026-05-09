; DESCRIPTION: Composite: Creates a white rectangular region at (235, 1) spanning 44 by 94 pixels then Draws a yellow line from (457, 232) to (483, 209).
; PLAN: r0=235(x), r1=1(y), r2=44(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=232(y1), r7=483(x2), r8=209(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 1
LDI r2, 44
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 232
LDI r7, 483
LDI r8, 209
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
