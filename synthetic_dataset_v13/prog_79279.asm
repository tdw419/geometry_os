; DESCRIPTION: Draws a green line from (355, 140) to (115, 119).
; PLAN: r0=355(x1), r1=140(y1), r2=115(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 140
LDI r2, 115
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
