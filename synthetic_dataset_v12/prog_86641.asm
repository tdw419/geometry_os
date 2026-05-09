; DESCRIPTION: Renders a black line between points (424, 154) and (59, 232).
; PLAN: r0=424(x1), r1=154(y1), r2=59(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 154
LDI r2, 59
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
