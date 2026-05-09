; DESCRIPTION: Composite: Draws a orange rectangle at (285, 78) with width 71 and height 109 then Draws a green line from (157, 159) to (409, 118).
; PLAN: r0=285(x), r1=78(y), r2=71(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x1), r6=159(y1), r7=409(x2), r8=118(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 78
LDI r2, 71
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 159
LDI r7, 409
LDI r8, 118
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
