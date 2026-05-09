; DESCRIPTION: Renders a red line between points (133, 18) and (45, 174).
; PLAN: r0=133(x1), r1=18(y1), r2=45(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 18
LDI r2, 45
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
