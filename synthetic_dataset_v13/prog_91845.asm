; DESCRIPTION: Composite: Draws a purple rectangle at (424, 94) with width 46 and height 80 then Draws a purple line from (217, 246) to (428, 76).
; PLAN: r0=424(x), r1=94(y), r2=46(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x1), r6=246(y1), r7=428(x2), r8=76(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 94
LDI r2, 46
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 246
LDI r7, 428
LDI r8, 76
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
