; DESCRIPTION: Composite: Places a purple line segment connecting (330, 19) to (409, 96) then Draws a red rectangle at (203, 70) with width 45 and height 46.
; PLAN: r0=330(x1), r1=19(y1), r2=409(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=70(y), r7=45(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 19
LDI r2, 409
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 70
LDI r7, 45
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
