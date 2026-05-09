; DESCRIPTION: Draws a green line from (53, 77) to (216, 89).
; PLAN: r0=53(x1), r1=77(y1), r2=216(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 77
LDI r2, 216
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
