; DESCRIPTION: Draws a white line from (505, 123) to (86, 74).
; PLAN: r0=505(x1), r1=123(y1), r2=86(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 123
LDI r2, 86
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
