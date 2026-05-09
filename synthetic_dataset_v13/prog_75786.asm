; DESCRIPTION: Renders a red line between points (446, 102) and (100, 218).
; PLAN: r0=446(x1), r1=102(y1), r2=100(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 102
LDI r2, 100
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
