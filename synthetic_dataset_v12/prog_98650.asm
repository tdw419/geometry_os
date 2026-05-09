; DESCRIPTION: Renders a black line between points (86, 97) and (420, 163).
; PLAN: r0=86(x1), r1=97(y1), r2=420(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 97
LDI r2, 420
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
