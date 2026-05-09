; DESCRIPTION: Composite: Renders a green line between points (66, 108) and (314, 198) then Draws a purple rectangle at (48, 143) with width 33 and height 107.
; PLAN: r0=66(x1), r1=108(y1), r2=314(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=143(y), r7=33(width), r8=107(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 108
LDI r2, 314
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 143
LDI r7, 33
LDI r8, 107
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
