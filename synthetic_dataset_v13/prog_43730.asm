; DESCRIPTION: Places a red line segment connecting (112, 36) to (95, 52).
; PLAN: r0=112(x1), r1=36(y1), r2=95(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 36
LDI r2, 95
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
