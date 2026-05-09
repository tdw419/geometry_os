; DESCRIPTION: Renders a magenta line between points (418, 48) and (451, 146).
; PLAN: r0=418(x1), r1=48(y1), r2=451(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 48
LDI r2, 451
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
