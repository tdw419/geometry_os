; DESCRIPTION: Renders a yellow line between points (431, 234) and (349, 46).
; PLAN: r0=431(x1), r1=234(y1), r2=349(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 234
LDI r2, 349
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
