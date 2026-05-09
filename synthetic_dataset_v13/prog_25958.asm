; DESCRIPTION: Renders a red line between points (496, 214) and (391, 129).
; PLAN: r0=496(x1), r1=214(y1), r2=391(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 214
LDI r2, 391
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
