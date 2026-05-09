; DESCRIPTION: Draws a green line from (62, 55) to (496, 124).
; PLAN: r0=62(x1), r1=55(y1), r2=496(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 55
LDI r2, 496
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
