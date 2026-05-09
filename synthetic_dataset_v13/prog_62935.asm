; DESCRIPTION: Renders a red line between points (365, 68) and (508, 17).
; PLAN: r0=365(x1), r1=68(y1), r2=508(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 68
LDI r2, 508
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
