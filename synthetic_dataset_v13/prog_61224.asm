; DESCRIPTION: Renders a yellow line between points (408, 193) and (363, 46).
; PLAN: r0=408(x1), r1=193(y1), r2=363(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 193
LDI r2, 363
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
