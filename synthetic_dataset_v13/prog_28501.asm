; DESCRIPTION: Renders a red line between points (219, 10) and (177, 234).
; PLAN: r0=219(x1), r1=10(y1), r2=177(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 10
LDI r2, 177
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
