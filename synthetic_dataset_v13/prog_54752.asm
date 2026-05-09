; DESCRIPTION: Renders a red line between points (315, 135) and (45, 73).
; PLAN: r0=315(x1), r1=135(y1), r2=45(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 135
LDI r2, 45
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
