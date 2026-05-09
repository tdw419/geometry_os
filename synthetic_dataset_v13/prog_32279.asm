; DESCRIPTION: Renders a green line between points (506, 71) and (19, 253).
; PLAN: r0=506(x1), r1=71(y1), r2=19(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 71
LDI r2, 19
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
