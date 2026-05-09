; DESCRIPTION: Renders a orange line between points (147, 108) and (511, 190).
; PLAN: r0=147(x1), r1=108(y1), r2=511(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 108
LDI r2, 511
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
