; DESCRIPTION: Renders a yellow line between points (389, 171) and (503, 89).
; PLAN: r0=389(x1), r1=171(y1), r2=503(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 171
LDI r2, 503
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
