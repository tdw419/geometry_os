; DESCRIPTION: Renders a yellow line between points (98, 61) and (475, 94).
; PLAN: r0=98(x1), r1=61(y1), r2=475(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 61
LDI r2, 475
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
