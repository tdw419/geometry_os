; DESCRIPTION: Composite: Draws a blue rectangle at (95, 48) with width 36 and height 108 then Draws a green line from (84, 198) to (497, 215).
; PLAN: r0=95(x), r1=48(y), r2=36(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x1), r6=198(y1), r7=497(x2), r8=215(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 48
LDI r2, 36
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 198
LDI r7, 497
LDI r8, 215
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
