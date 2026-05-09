; DESCRIPTION: Renders a yellow line between points (319, 194) and (124, 128).
; PLAN: r0=319(x1), r1=194(y1), r2=124(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 194
LDI r2, 124
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
