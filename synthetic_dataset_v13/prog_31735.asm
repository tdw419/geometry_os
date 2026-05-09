; DESCRIPTION: Renders a red line between points (355, 89) and (303, 174).
; PLAN: r0=355(x1), r1=89(y1), r2=303(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 89
LDI r2, 303
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
