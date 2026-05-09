; DESCRIPTION: Renders a green line between points (335, 43) and (337, 84).
; PLAN: r0=335(x1), r1=43(y1), r2=337(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 43
LDI r2, 337
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
