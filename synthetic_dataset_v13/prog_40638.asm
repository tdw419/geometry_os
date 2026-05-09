; DESCRIPTION: Renders a white line between points (4, 174) and (484, 229).
; PLAN: r0=4(x1), r1=174(y1), r2=484(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 174
LDI r2, 484
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
