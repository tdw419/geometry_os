; DESCRIPTION: Renders a yellow line between points (422, 142) and (356, 0).
; PLAN: r0=422(x1), r1=142(y1), r2=356(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 142
LDI r2, 356
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
