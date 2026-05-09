; DESCRIPTION: Composite: Places a yellow line segment connecting (251, 202) to (335, 141) then Draws a green rectangle at (237, 79) with width 21 and height 15.
; PLAN: r0=251(x1), r1=202(y1), r2=335(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=79(y), r7=21(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 202
LDI r2, 335
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 79
LDI r7, 21
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
