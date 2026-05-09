; DESCRIPTION: Renders a magenta line between points (11, 56) and (322, 38).
; PLAN: r0=11(x1), r1=56(y1), r2=322(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 56
LDI r2, 322
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
