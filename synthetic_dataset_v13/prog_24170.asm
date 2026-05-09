; DESCRIPTION: Composite: Draws a yellow rectangle at (261, 124) with width 68 and height 108 then Draws a purple line from (280, 133) to (315, 6).
; PLAN: r0=261(x), r1=124(y), r2=68(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=133(y1), r7=315(x2), r8=6(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 124
LDI r2, 68
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 133
LDI r7, 315
LDI r8, 6
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
