; DESCRIPTION: Renders a purple line between points (202, 191) and (21, 226).
; PLAN: r0=202(x1), r1=191(y1), r2=21(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 191
LDI r2, 21
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
