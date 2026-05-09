; DESCRIPTION: Renders a yellow line between points (491, 46) and (396, 160).
; PLAN: r0=491(x1), r1=46(y1), r2=396(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 46
LDI r2, 396
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
