; DESCRIPTION: Renders a red line between points (148, 138) and (189, 70).
; PLAN: r0=148(x1), r1=138(y1), r2=189(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 138
LDI r2, 189
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
