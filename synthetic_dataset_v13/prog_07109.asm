; DESCRIPTION: Renders a black line between points (501, 46) and (73, 240).
; PLAN: r0=501(x1), r1=46(y1), r2=73(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 46
LDI r2, 73
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
