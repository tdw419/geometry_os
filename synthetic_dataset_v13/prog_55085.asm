; DESCRIPTION: Draws a red line from (45, 105) to (435, 169).
; PLAN: r0=45(x1), r1=105(y1), r2=435(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 105
LDI r2, 435
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
