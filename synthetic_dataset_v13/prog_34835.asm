; DESCRIPTION: Composite: Draws a orange line from (160, 141) to (186, 65) then Creates a red rectangular region at (309, 101) spanning 11 by 28 pixels.
; PLAN: r0=160(x1), r1=141(y1), r2=186(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=101(y), r7=11(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 141
LDI r2, 186
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 101
LDI r7, 11
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
