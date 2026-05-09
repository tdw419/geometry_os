; DESCRIPTION: Composite: Draws a white rectangle at (274, 113) with width 63 and height 63 then Draws a orange line from (216, 111) to (337, 61).
; PLAN: r0=274(x), r1=113(y), r2=63(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x1), r6=111(y1), r7=337(x2), r8=61(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 113
LDI r2, 63
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 111
LDI r7, 337
LDI r8, 61
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
