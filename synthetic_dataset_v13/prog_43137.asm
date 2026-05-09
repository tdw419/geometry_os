; DESCRIPTION: Renders a magenta line between points (322, 214) and (89, 46).
; PLAN: r0=322(x1), r1=214(y1), r2=89(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 214
LDI r2, 89
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
