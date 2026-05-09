; DESCRIPTION: Renders a green line between points (276, 19) and (216, 162).
; PLAN: r0=276(x1), r1=19(y1), r2=216(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 19
LDI r2, 216
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
