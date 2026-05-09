; DESCRIPTION: Renders a magenta line between points (56, 147) and (405, 253).
; PLAN: r0=56(x1), r1=147(y1), r2=405(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 147
LDI r2, 405
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
