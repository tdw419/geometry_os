; DESCRIPTION: Renders a white line between points (186, 121) and (34, 252).
; PLAN: r0=186(x1), r1=121(y1), r2=34(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 121
LDI r2, 34
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
