; DESCRIPTION: Renders a blue line between points (420, 251) and (406, 43).
; PLAN: r0=420(x1), r1=251(y1), r2=406(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 251
LDI r2, 406
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
