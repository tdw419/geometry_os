; DESCRIPTION: Renders a green line between points (367, 227) and (6, 220).
; PLAN: r0=367(x1), r1=227(y1), r2=6(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 227
LDI r2, 6
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
