; DESCRIPTION: Renders a black line between points (236, 203) and (322, 205).
; PLAN: r0=236(x1), r1=203(y1), r2=322(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 203
LDI r2, 322
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
