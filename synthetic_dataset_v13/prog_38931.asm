; DESCRIPTION: Composite: Draws a purple rectangle at (77, 9) with width 47 and height 67 then Draws a yellow line from (27, 108) to (350, 227).
; PLAN: r0=77(x), r1=9(y), r2=47(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x1), r6=108(y1), r7=350(x2), r8=227(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 9
LDI r2, 47
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 108
LDI r7, 350
LDI r8, 227
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
