; DESCRIPTION: Draws a red line from (330, 169) to (192, 184).
; PLAN: r0=330(x1), r1=169(y1), r2=192(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 169
LDI r2, 192
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
