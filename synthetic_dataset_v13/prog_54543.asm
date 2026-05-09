; DESCRIPTION: Renders a black line between points (140, 170) and (405, 116).
; PLAN: r0=140(x1), r1=170(y1), r2=405(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 170
LDI r2, 405
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
