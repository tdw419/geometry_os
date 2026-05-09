; DESCRIPTION: Renders a white line between points (181, 141) and (303, 229).
; PLAN: r0=181(x1), r1=141(y1), r2=303(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 141
LDI r2, 303
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
