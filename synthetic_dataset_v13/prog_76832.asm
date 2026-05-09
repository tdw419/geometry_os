; DESCRIPTION: Draws a yellow line from (223, 89) to (122, 237).
; PLAN: r0=223(x1), r1=89(y1), r2=122(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 89
LDI r2, 122
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
