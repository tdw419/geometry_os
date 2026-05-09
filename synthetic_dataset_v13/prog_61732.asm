; DESCRIPTION: Renders a black line between points (301, 21) and (455, 162).
; PLAN: r0=301(x1), r1=21(y1), r2=455(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 21
LDI r2, 455
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
