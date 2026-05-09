; DESCRIPTION: Composite: Draws a white line from (419, 198) to (505, 54) then Draws a green rectangle at (85, 145) with width 100 and height 48.
; PLAN: r0=419(x1), r1=198(y1), r2=505(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=145(y), r7=100(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 198
LDI r2, 505
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 145
LDI r7, 100
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
