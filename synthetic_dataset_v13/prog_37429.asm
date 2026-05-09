; DESCRIPTION: Renders a yellow line between points (82, 111) and (201, 253).
; PLAN: r0=82(x1), r1=111(y1), r2=201(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 111
LDI r2, 201
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
