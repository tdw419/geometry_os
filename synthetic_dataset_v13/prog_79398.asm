; DESCRIPTION: Renders a magenta line between points (487, 94) and (155, 182).
; PLAN: r0=487(x1), r1=94(y1), r2=155(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 94
LDI r2, 155
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
