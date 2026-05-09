; DESCRIPTION: Renders a black line between points (97, 226) and (412, 217).
; PLAN: r0=97(x1), r1=226(y1), r2=412(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 226
LDI r2, 412
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
