; DESCRIPTION: Renders a green line between points (322, 241) and (485, 115).
; PLAN: r0=322(x1), r1=241(y1), r2=485(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 241
LDI r2, 485
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
