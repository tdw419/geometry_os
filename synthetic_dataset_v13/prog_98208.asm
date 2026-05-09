; DESCRIPTION: Composite: Draws a yellow rectangle at (271, 118) with width 111 and height 107 then Draws a yellow line from (219, 234) to (131, 121).
; PLAN: r0=271(x), r1=118(y), r2=111(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x1), r6=234(y1), r7=131(x2), r8=121(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 118
LDI r2, 111
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 234
LDI r7, 131
LDI r8, 121
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
