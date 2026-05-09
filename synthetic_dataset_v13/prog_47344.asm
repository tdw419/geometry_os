; DESCRIPTION: Draws a orange line from (303, 133) to (415, 100).
; PLAN: r0=303(x1), r1=133(y1), r2=415(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 133
LDI r2, 415
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
