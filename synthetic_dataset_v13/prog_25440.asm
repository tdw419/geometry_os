; DESCRIPTION: Renders a yellow line between points (317, 147) and (367, 32).
; PLAN: r0=317(x1), r1=147(y1), r2=367(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 147
LDI r2, 367
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
