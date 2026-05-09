; DESCRIPTION: Renders a orange line between points (454, 127) and (322, 197).
; PLAN: r0=454(x1), r1=127(y1), r2=322(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 127
LDI r2, 322
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
