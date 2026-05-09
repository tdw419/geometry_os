; DESCRIPTION: Draws a yellow line from (505, 172) to (25, 76).
; PLAN: r0=505(x1), r1=172(y1), r2=25(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 172
LDI r2, 25
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
