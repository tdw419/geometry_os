; DESCRIPTION: Renders a red line between points (345, 253) and (266, 212).
; PLAN: r0=345(x1), r1=253(y1), r2=266(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 253
LDI r2, 266
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
