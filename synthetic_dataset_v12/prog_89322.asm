; DESCRIPTION: Renders a black line between points (388, 214) and (498, 253).
; PLAN: r0=388(x1), r1=214(y1), r2=498(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 214
LDI r2, 498
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
