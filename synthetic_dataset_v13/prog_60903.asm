; DESCRIPTION: Renders a red line between points (135, 70) and (36, 165).
; PLAN: r0=135(x1), r1=70(y1), r2=36(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 70
LDI r2, 36
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
