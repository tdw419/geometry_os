; DESCRIPTION: Renders a blue line between points (322, 168) and (261, 29).
; PLAN: r0=322(x1), r1=168(y1), r2=261(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 168
LDI r2, 261
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
