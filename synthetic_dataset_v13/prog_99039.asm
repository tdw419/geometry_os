; DESCRIPTION: Renders a green line between points (458, 26) and (496, 174).
; PLAN: r0=458(x1), r1=26(y1), r2=496(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 26
LDI r2, 496
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
