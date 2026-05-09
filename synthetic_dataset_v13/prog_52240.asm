; DESCRIPTION: Renders a white line between points (140, 59) and (78, 81).
; PLAN: r0=140(x1), r1=59(y1), r2=78(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 59
LDI r2, 78
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
