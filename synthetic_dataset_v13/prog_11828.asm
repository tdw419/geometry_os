; DESCRIPTION: Draws a yellow line from (86, 77) to (216, 68).
; PLAN: r0=86(x1), r1=77(y1), r2=216(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 77
LDI r2, 216
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
