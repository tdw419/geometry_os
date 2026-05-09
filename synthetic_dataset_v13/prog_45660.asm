; DESCRIPTION: Places a red line segment connecting (510, 181) to (5, 102).
; PLAN: r0=510(x1), r1=181(y1), r2=5(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 181
LDI r2, 5
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
