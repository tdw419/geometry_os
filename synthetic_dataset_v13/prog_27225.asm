; DESCRIPTION: Renders a blue line between points (102, 215) and (322, 236).
; PLAN: r0=102(x1), r1=215(y1), r2=322(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 215
LDI r2, 322
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
