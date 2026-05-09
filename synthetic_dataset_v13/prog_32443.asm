; DESCRIPTION: Draws a green line from (216, 199) to (78, 47).
; PLAN: r0=216(x1), r1=199(y1), r2=78(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 199
LDI r2, 78
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
