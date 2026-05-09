; DESCRIPTION: Renders a red line between points (141, 4) and (409, 234).
; PLAN: r0=141(x1), r1=4(y1), r2=409(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 4
LDI r2, 409
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
