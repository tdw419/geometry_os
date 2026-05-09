; DESCRIPTION: Renders a black line between points (73, 57) and (90, 160).
; PLAN: r0=73(x1), r1=57(y1), r2=90(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 57
LDI r2, 90
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
