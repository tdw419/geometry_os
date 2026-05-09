; DESCRIPTION: Renders a red line between points (102, 99) and (138, 149).
; PLAN: r0=102(x1), r1=99(y1), r2=138(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 99
LDI r2, 138
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
