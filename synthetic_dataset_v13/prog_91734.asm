; DESCRIPTION: Renders a purple line between points (417, 234) and (463, 55).
; PLAN: r0=417(x1), r1=234(y1), r2=463(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 234
LDI r2, 463
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
