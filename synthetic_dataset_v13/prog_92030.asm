; DESCRIPTION: Renders a blue line between points (32, 102) and (323, 126).
; PLAN: r0=32(x1), r1=102(y1), r2=323(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 102
LDI r2, 323
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
