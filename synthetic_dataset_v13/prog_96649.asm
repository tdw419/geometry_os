; DESCRIPTION: Renders a red line between points (113, 119) and (205, 92).
; PLAN: r0=113(x1), r1=119(y1), r2=205(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 119
LDI r2, 205
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
