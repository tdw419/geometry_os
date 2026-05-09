; DESCRIPTION: Renders a yellow line between points (3, 10) and (335, 197).
; PLAN: r0=3(x1), r1=10(y1), r2=335(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 10
LDI r2, 335
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
