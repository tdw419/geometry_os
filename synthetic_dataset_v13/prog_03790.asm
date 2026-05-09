; DESCRIPTION: Draws a orange line from (133, 179) to (401, 149).
; PLAN: r0=133(x1), r1=179(y1), r2=401(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 179
LDI r2, 401
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
