; DESCRIPTION: Renders a red line between points (152, 95) and (399, 79).
; PLAN: r0=152(x1), r1=95(y1), r2=399(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 95
LDI r2, 399
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
