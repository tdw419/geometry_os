; DESCRIPTION: Composite: Draws a black rectangle at (195, 38) with width 79 and height 116 then Renders a green line between points (371, 162) and (261, 251).
; PLAN: r0=195(x), r1=38(y), r2=79(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=162(y1), r7=261(x2), r8=251(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 38
LDI r2, 79
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 162
LDI r7, 261
LDI r8, 251
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
