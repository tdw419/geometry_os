; DESCRIPTION: Renders a yellow line between points (478, 234) and (292, 218).
; PLAN: r0=478(x1), r1=234(y1), r2=292(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 234
LDI r2, 292
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
