; DESCRIPTION: Renders a yellow line between points (321, 94) and (164, 4).
; PLAN: r0=321(x1), r1=94(y1), r2=164(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 94
LDI r2, 164
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
