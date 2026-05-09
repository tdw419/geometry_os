; DESCRIPTION: Renders a red line between points (259, 115) and (273, 222).
; PLAN: r0=259(x1), r1=115(y1), r2=273(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 115
LDI r2, 273
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
