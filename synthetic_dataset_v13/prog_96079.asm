; DESCRIPTION: Renders a green line between points (57, 142) and (78, 140).
; PLAN: r0=57(x1), r1=142(y1), r2=78(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 142
LDI r2, 78
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
