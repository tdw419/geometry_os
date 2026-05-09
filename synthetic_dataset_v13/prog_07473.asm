; DESCRIPTION: Draws a yellow line from (124, 142) to (383, 133).
; PLAN: r0=124(x1), r1=142(y1), r2=383(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 142
LDI r2, 383
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
