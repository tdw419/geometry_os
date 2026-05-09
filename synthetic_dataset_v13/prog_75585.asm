; DESCRIPTION: Renders a blue line between points (91, 191) and (301, 87).
; PLAN: r0=91(x1), r1=191(y1), r2=301(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 191
LDI r2, 301
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
