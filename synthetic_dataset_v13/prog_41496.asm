; DESCRIPTION: Draws a white line from (15, 133) to (505, 0).
; PLAN: r0=15(x1), r1=133(y1), r2=505(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 133
LDI r2, 505
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
