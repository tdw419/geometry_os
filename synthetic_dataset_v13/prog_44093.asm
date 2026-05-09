; DESCRIPTION: Composite: Draws a yellow line from (357, 133) to (362, 38) then Creates a orange rectangular region at (227, 100) spanning 35 by 39 pixels.
; PLAN: r0=357(x1), r1=133(y1), r2=362(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=100(y), r7=35(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 133
LDI r2, 362
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 100
LDI r7, 35
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
