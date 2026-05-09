; DESCRIPTION: Renders a white line between points (355, 94) and (432, 167).
; PLAN: r0=355(x1), r1=94(y1), r2=432(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 94
LDI r2, 432
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
