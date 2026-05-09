; DESCRIPTION: Composite: Draws a purple rectangle at (295, 212) with width 98 and height 19 then Places a white line segment connecting (493, 133) to (420, 97).
; PLAN: r0=295(x), r1=212(y), r2=98(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=493(x1), r6=133(y1), r7=420(x2), r8=97(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 212
LDI r2, 98
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 133
LDI r7, 420
LDI r8, 97
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
