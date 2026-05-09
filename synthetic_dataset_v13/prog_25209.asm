; DESCRIPTION: Renders a black line between points (176, 0) and (314, 32).
; PLAN: r0=176(x1), r1=0(y1), r2=314(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 0
LDI r2, 314
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
