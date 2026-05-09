; DESCRIPTION: Renders a white line between points (95, 7) and (503, 141).
; PLAN: r0=95(x1), r1=7(y1), r2=503(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 7
LDI r2, 503
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
