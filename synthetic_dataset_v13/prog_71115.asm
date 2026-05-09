; DESCRIPTION: Composite: Draws a red rectangle at (219, 36) with width 61 and height 53 then Draws a purple line from (471, 132) to (428, 62).
; PLAN: r0=219(x), r1=36(y), r2=61(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=132(y1), r7=428(x2), r8=62(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 36
LDI r2, 61
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 132
LDI r7, 428
LDI r8, 62
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
