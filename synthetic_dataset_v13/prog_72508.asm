; DESCRIPTION: Renders a red line between points (322, 35) and (205, 214).
; PLAN: r0=322(x1), r1=35(y1), r2=205(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 35
LDI r2, 205
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
