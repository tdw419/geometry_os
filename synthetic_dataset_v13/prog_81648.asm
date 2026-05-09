; DESCRIPTION: Renders a red line between points (273, 226) and (345, 99).
; PLAN: r0=273(x1), r1=226(y1), r2=345(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 226
LDI r2, 345
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
