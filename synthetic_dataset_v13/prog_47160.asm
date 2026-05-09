; DESCRIPTION: Composite: Draws a orange rectangle at (291, 179) with width 38 and height 76 then Renders a green line between points (229, 168) and (489, 155).
; PLAN: r0=291(x), r1=179(y), r2=38(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x1), r6=168(y1), r7=489(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 179
LDI r2, 38
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 168
LDI r7, 489
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
