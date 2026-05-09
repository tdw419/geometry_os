; DESCRIPTION: Renders a red line between points (425, 82) and (31, 208).
; PLAN: r0=425(x1), r1=82(y1), r2=31(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 82
LDI r2, 31
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
