; DESCRIPTION: Draws a green line from (385, 143) to (149, 169).
; PLAN: r0=385(x1), r1=143(y1), r2=149(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 143
LDI r2, 149
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
