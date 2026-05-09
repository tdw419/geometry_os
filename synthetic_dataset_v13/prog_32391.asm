; DESCRIPTION: Draws a yellow line from (419, 192) to (223, 237).
; PLAN: r0=419(x1), r1=192(y1), r2=223(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 192
LDI r2, 223
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
