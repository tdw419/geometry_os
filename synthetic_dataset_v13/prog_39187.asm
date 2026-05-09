; DESCRIPTION: Renders a red line between points (124, 214) and (251, 122).
; PLAN: r0=124(x1), r1=214(y1), r2=251(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 214
LDI r2, 251
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
