; DESCRIPTION: Renders a green line between points (150, 226) and (89, 105).
; PLAN: r0=150(x1), r1=226(y1), r2=89(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 226
LDI r2, 89
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
