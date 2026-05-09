; DESCRIPTION: Composite: Draws a yellow rectangle at (292, 165) with width 84 and height 87 then Draws a white line from (394, 131) to (258, 105).
; PLAN: r0=292(x), r1=165(y), r2=84(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=131(y1), r7=258(x2), r8=105(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 165
LDI r2, 84
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 131
LDI r7, 258
LDI r8, 105
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
