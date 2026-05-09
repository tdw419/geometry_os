; DESCRIPTION: Renders a blue line between points (418, 176) and (259, 251).
; PLAN: r0=418(x1), r1=176(y1), r2=259(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 176
LDI r2, 259
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
