; DESCRIPTION: Composite: Draws a green line from (318, 192) to (337, 89) then Draws a red rectangle at (324, 86) with width 59 and height 69.
; PLAN: r0=318(x1), r1=192(y1), r2=337(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=86(y), r7=59(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 192
LDI r2, 337
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 86
LDI r7, 59
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
