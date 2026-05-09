; DESCRIPTION: Renders a green line between points (90, 161) and (451, 249).
; PLAN: r0=90(x1), r1=161(y1), r2=451(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 161
LDI r2, 451
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
