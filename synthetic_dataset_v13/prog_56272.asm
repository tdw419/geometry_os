; DESCRIPTION: Renders a magenta line between points (347, 111) and (138, 253).
; PLAN: r0=347(x1), r1=111(y1), r2=138(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 111
LDI r2, 138
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
