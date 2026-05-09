; DESCRIPTION: Renders a green line between points (359, 143) and (436, 80).
; PLAN: r0=359(x1), r1=143(y1), r2=436(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 143
LDI r2, 436
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
