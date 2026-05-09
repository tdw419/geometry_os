; DESCRIPTION: Draws a orange line from (317, 162) to (238, 71).
; PLAN: r0=317(x1), r1=162(y1), r2=238(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 162
LDI r2, 238
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
