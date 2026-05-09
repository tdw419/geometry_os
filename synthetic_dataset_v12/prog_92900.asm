; DESCRIPTION: Renders a red line between points (196, 216) and (361, 251).
; PLAN: r0=196(x1), r1=216(y1), r2=361(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 216
LDI r2, 361
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
