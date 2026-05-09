; DESCRIPTION: Renders a red line between points (118, 202) and (160, 149).
; PLAN: r0=118(x1), r1=202(y1), r2=160(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 202
LDI r2, 160
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
