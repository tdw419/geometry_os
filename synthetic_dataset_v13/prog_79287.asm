; DESCRIPTION: Renders a green line between points (431, 223) and (143, 94).
; PLAN: r0=431(x1), r1=223(y1), r2=143(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 223
LDI r2, 143
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
