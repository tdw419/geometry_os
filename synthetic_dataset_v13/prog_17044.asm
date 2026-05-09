; DESCRIPTION: Renders a red line between points (418, 140) and (84, 208).
; PLAN: r0=418(x1), r1=140(y1), r2=84(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 140
LDI r2, 84
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
