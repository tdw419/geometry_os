; DESCRIPTION: Renders a red line between points (277, 118) and (285, 120).
; PLAN: r0=277(x1), r1=118(y1), r2=285(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 118
LDI r2, 285
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
