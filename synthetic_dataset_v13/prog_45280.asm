; DESCRIPTION: Renders a red line between points (94, 11) and (87, 59).
; PLAN: r0=94(x1), r1=11(y1), r2=87(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 11
LDI r2, 87
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
