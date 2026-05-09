; DESCRIPTION: Draws a orange line from (216, 190) to (71, 223).
; PLAN: r0=216(x1), r1=190(y1), r2=71(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 190
LDI r2, 71
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
