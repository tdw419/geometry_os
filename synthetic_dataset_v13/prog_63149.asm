; DESCRIPTION: Draws a magenta line from (134, 33) to (149, 149).
; PLAN: r0=134(x1), r1=33(y1), r2=149(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 33
LDI r2, 149
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
