; DESCRIPTION: Places a orange line segment connecting (79, 177) to (297, 85).
; PLAN: r0=79(x1), r1=177(y1), r2=297(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 177
LDI r2, 297
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
