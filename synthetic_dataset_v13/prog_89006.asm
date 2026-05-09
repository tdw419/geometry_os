; DESCRIPTION: Renders a blue line between points (271, 138) and (322, 213).
; PLAN: r0=271(x1), r1=138(y1), r2=322(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 138
LDI r2, 322
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
