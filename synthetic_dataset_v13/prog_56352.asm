; DESCRIPTION: Renders a yellow line between points (422, 147) and (182, 181).
; PLAN: r0=422(x1), r1=147(y1), r2=182(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 147
LDI r2, 182
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
