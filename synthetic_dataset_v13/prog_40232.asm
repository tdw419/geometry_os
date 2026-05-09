; DESCRIPTION: Composite: Draws a yellow rectangle at (239, 134) with width 64 and height 61 then Draws a orange line from (36, 95) to (261, 156).
; PLAN: r0=239(x), r1=134(y), r2=64(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x1), r6=95(y1), r7=261(x2), r8=156(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 134
LDI r2, 64
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 95
LDI r7, 261
LDI r8, 156
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
