; DESCRIPTION: Renders a red line between points (253, 171) and (431, 45).
; PLAN: r0=253(x1), r1=171(y1), r2=431(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 171
LDI r2, 431
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
