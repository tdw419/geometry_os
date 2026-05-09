; DESCRIPTION: Composite: Draws a red rectangle at (131, 5) with width 80 and height 71 then Draws a purple line from (483, 95) to (62, 210).
; PLAN: r0=131(x), r1=5(y), r2=80(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=95(y1), r7=62(x2), r8=210(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 5
LDI r2, 80
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 95
LDI r7, 62
LDI r8, 210
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
