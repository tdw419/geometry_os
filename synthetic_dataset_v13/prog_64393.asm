; DESCRIPTION: Renders a blue line between points (40, 211) and (131, 107).
; PLAN: r0=40(x1), r1=211(y1), r2=131(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 211
LDI r2, 131
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
