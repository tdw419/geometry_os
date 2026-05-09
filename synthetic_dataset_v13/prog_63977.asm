; DESCRIPTION: Renders a yellow line between points (9, 70) and (418, 140).
; PLAN: r0=9(x1), r1=70(y1), r2=418(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 70
LDI r2, 418
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
