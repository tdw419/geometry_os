; DESCRIPTION: Renders a magenta line between points (165, 18) and (451, 236).
; PLAN: r0=165(x1), r1=18(y1), r2=451(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 18
LDI r2, 451
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
