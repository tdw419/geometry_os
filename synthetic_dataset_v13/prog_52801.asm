; DESCRIPTION: Renders a black line between points (322, 194) and (263, 25).
; PLAN: r0=322(x1), r1=194(y1), r2=263(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 194
LDI r2, 263
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
