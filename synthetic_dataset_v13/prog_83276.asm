; DESCRIPTION: Renders a white line between points (19, 140) and (367, 78).
; PLAN: r0=19(x1), r1=140(y1), r2=367(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 140
LDI r2, 367
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
