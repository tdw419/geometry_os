; DESCRIPTION: Renders a magenta line between points (322, 201) and (333, 87).
; PLAN: r0=322(x1), r1=201(y1), r2=333(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 201
LDI r2, 333
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
