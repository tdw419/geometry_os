; DESCRIPTION: Renders a yellow line between points (273, 237) and (237, 120).
; PLAN: r0=273(x1), r1=237(y1), r2=237(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 237
LDI r2, 237
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
