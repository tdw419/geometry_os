; DESCRIPTION: Renders a yellow line between points (451, 75) and (94, 113).
; PLAN: r0=451(x1), r1=75(y1), r2=94(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 75
LDI r2, 94
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
