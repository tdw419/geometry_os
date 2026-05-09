; DESCRIPTION: Renders a red line between points (143, 79) and (288, 5).
; PLAN: r0=143(x1), r1=79(y1), r2=288(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 79
LDI r2, 288
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
