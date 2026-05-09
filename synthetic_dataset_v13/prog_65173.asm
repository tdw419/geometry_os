; DESCRIPTION: Renders a red line between points (241, 107) and (181, 31).
; PLAN: r0=241(x1), r1=107(y1), r2=181(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 107
LDI r2, 181
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
