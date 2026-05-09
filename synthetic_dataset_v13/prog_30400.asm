; DESCRIPTION: Renders a red line between points (27, 133) and (121, 22).
; PLAN: r0=27(x1), r1=133(y1), r2=121(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 133
LDI r2, 121
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
