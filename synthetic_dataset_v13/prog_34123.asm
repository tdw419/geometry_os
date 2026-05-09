; DESCRIPTION: Renders a white line between points (265, 107) and (266, 140).
; PLAN: r0=265(x1), r1=107(y1), r2=266(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 107
LDI r2, 266
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
