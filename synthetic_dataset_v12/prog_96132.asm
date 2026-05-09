; DESCRIPTION: Renders a black line between points (221, 209) and (321, 163).
; PLAN: r0=221(x1), r1=209(y1), r2=321(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 209
LDI r2, 321
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
