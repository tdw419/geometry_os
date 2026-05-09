; DESCRIPTION: Composite: Draws a orange line from (411, 213) to (243, 174) then Creates a magenta rectangular region at (222, 52) spanning 75 by 93 pixels.
; PLAN: r0=411(x1), r1=213(y1), r2=243(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=52(y), r7=75(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 213
LDI r2, 243
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 52
LDI r7, 75
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
