; DESCRIPTION: Composite: Draws a blue line from (416, 41) to (366, 133) then Creates a magenta rectangular region at (159, 193) spanning 64 by 13 pixels.
; PLAN: r0=416(x1), r1=41(y1), r2=366(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=193(y), r7=64(width), r8=13(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 41
LDI r2, 366
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 193
LDI r7, 64
LDI r8, 13
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
