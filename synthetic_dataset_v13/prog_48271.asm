; DESCRIPTION: Renders a green line between points (94, 169) and (17, 86).
; PLAN: r0=94(x1), r1=169(y1), r2=17(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 169
LDI r2, 17
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
