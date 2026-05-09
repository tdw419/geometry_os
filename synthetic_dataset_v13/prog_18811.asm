; DESCRIPTION: Renders a red line between points (160, 162) and (25, 141).
; PLAN: r0=160(x1), r1=162(y1), r2=25(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 162
LDI r2, 25
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
