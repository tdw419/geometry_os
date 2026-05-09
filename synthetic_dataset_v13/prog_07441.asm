; DESCRIPTION: Renders a yellow line between points (191, 151) and (451, 128).
; PLAN: r0=191(x1), r1=151(y1), r2=451(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 151
LDI r2, 451
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
