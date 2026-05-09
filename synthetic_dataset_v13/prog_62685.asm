; DESCRIPTION: Draws a magenta line from (477, 2) to (151, 223).
; PLAN: r0=477(x1), r1=2(y1), r2=151(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 2
LDI r2, 151
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
