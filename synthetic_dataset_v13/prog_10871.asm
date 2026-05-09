; DESCRIPTION: Renders a red line between points (77, 137) and (288, 182).
; PLAN: r0=77(x1), r1=137(y1), r2=288(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 137
LDI r2, 288
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
