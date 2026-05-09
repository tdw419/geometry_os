; DESCRIPTION: Renders a yellow line between points (451, 9) and (13, 242).
; PLAN: r0=451(x1), r1=9(y1), r2=13(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 9
LDI r2, 13
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
