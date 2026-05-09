; DESCRIPTION: Renders a white line between points (234, 193) and (6, 212).
; PLAN: r0=234(x1), r1=193(y1), r2=6(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 193
LDI r2, 6
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
