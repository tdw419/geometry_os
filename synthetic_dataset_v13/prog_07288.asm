; DESCRIPTION: Renders a white line between points (98, 229) and (123, 77).
; PLAN: r0=98(x1), r1=229(y1), r2=123(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 229
LDI r2, 123
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
