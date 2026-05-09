; DESCRIPTION: Renders a blue line between points (278, 73) and (355, 86).
; PLAN: r0=278(x1), r1=73(y1), r2=355(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 73
LDI r2, 355
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
