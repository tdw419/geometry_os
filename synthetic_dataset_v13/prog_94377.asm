; DESCRIPTION: Composite: Draws a white line from (461, 214) to (157, 151) then Creates a purple rectangular region at (166, 198) spanning 36 by 52 pixels.
; PLAN: r0=461(x1), r1=214(y1), r2=157(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=198(y), r7=36(width), r8=52(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 214
LDI r2, 157
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 198
LDI r7, 36
LDI r8, 52
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
