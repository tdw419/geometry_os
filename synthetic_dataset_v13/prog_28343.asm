; DESCRIPTION: Renders a purple line between points (301, 205) and (324, 194).
; PLAN: r0=301(x1), r1=205(y1), r2=324(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 205
LDI r2, 324
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
