; DESCRIPTION: Renders a green line between points (46, 15) and (451, 67).
; PLAN: r0=46(x1), r1=15(y1), r2=451(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 15
LDI r2, 451
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
