; DESCRIPTION: Renders a red line between points (343, 99) and (277, 214).
; PLAN: r0=343(x1), r1=99(y1), r2=277(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 99
LDI r2, 277
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
