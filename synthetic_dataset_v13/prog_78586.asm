; DESCRIPTION: Draws a orange line from (473, 28) to (177, 180).
; PLAN: r0=473(x1), r1=28(y1), r2=177(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 28
LDI r2, 177
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
