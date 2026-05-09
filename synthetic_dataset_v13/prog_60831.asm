; DESCRIPTION: Renders a yellow line between points (422, 115) and (362, 204).
; PLAN: r0=422(x1), r1=115(y1), r2=362(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 115
LDI r2, 362
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
