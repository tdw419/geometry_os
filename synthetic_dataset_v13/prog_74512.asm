; DESCRIPTION: Renders a white line between points (413, 127) and (41, 77).
; PLAN: r0=413(x1), r1=127(y1), r2=41(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 127
LDI r2, 41
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
