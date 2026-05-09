; DESCRIPTION: Renders a yellow line between points (411, 180) and (411, 124).
; PLAN: r0=411(x1), r1=180(y1), r2=411(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 180
LDI r2, 411
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
