; DESCRIPTION: Renders a black line between points (496, 58) and (59, 108).
; PLAN: r0=496(x1), r1=58(y1), r2=59(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 58
LDI r2, 59
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
