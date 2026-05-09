; DESCRIPTION: Renders a green line between points (143, 183) and (431, 47).
; PLAN: r0=143(x1), r1=183(y1), r2=431(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 183
LDI r2, 431
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
