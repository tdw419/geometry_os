; DESCRIPTION: Renders a yellow line between points (493, 193) and (381, 244).
; PLAN: r0=493(x1), r1=193(y1), r2=381(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 193
LDI r2, 381
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
