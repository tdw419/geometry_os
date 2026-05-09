; DESCRIPTION: Draws a magenta line from (443, 6) to (484, 69).
; PLAN: r0=443(x1), r1=6(y1), r2=484(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 6
LDI r2, 484
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
