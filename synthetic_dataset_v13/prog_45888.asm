; DESCRIPTION: Renders a red line between points (445, 1) and (73, 217).
; PLAN: r0=445(x1), r1=1(y1), r2=73(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 1
LDI r2, 73
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
