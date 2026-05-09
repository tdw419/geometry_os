; DESCRIPTION: Renders a green line between points (4, 137) and (337, 142).
; PLAN: r0=4(x1), r1=137(y1), r2=337(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 137
LDI r2, 337
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
