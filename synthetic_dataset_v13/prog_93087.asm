; DESCRIPTION: Renders a white line between points (174, 6) and (25, 216).
; PLAN: r0=174(x1), r1=6(y1), r2=25(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 6
LDI r2, 25
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
