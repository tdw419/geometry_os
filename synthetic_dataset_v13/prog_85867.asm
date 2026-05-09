; DESCRIPTION: Renders a orange line between points (405, 202) and (347, 216).
; PLAN: r0=405(x1), r1=202(y1), r2=347(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 202
LDI r2, 347
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
