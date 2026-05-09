; DESCRIPTION: Draws a magenta line from (53, 12) to (149, 87).
; PLAN: r0=53(x1), r1=12(y1), r2=149(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 12
LDI r2, 149
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
