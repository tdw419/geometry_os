; DESCRIPTION: Renders a red line between points (148, 124) and (454, 180).
; PLAN: r0=148(x1), r1=124(y1), r2=454(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 124
LDI r2, 454
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
