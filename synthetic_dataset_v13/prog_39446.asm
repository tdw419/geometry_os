; DESCRIPTION: Renders a red line between points (436, 125) and (371, 238).
; PLAN: r0=436(x1), r1=125(y1), r2=371(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 125
LDI r2, 371
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
