; DESCRIPTION: Renders a red line between points (122, 230) and (285, 131).
; PLAN: r0=122(x1), r1=230(y1), r2=285(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 230
LDI r2, 285
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
