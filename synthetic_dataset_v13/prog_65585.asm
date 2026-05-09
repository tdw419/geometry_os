; DESCRIPTION: Renders a red line between points (278, 12) and (483, 221).
; PLAN: r0=278(x1), r1=12(y1), r2=483(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 12
LDI r2, 483
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
