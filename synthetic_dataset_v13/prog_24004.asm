; DESCRIPTION: Renders a red line between points (437, 214) and (151, 122).
; PLAN: r0=437(x1), r1=214(y1), r2=151(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 214
LDI r2, 151
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
