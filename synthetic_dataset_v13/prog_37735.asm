; DESCRIPTION: Renders a white line between points (461, 40) and (21, 145).
; PLAN: r0=461(x1), r1=40(y1), r2=21(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 40
LDI r2, 21
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
