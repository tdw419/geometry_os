; DESCRIPTION: Renders a green line between points (205, 145) and (301, 194).
; PLAN: r0=205(x1), r1=145(y1), r2=301(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 145
LDI r2, 301
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
