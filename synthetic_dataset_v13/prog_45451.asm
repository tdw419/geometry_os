; DESCRIPTION: Places a black line segment connecting (97, 27) to (322, 169).
; PLAN: r0=97(x1), r1=27(y1), r2=322(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 27
LDI r2, 322
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
