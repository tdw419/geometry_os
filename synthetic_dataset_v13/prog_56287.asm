; DESCRIPTION: Draws a red line from (426, 169) to (511, 222).
; PLAN: r0=426(x1), r1=169(y1), r2=511(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 169
LDI r2, 511
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
