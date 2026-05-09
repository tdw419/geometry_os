; DESCRIPTION: Renders a yellow line between points (322, 37) and (451, 213).
; PLAN: r0=322(x1), r1=37(y1), r2=451(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 37
LDI r2, 451
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
