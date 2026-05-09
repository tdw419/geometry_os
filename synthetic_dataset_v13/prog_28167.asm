; DESCRIPTION: Renders a red line between points (19, 79) and (356, 3).
; PLAN: r0=19(x1), r1=79(y1), r2=356(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 79
LDI r2, 356
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
