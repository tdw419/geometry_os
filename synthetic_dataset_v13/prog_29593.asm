; DESCRIPTION: Renders a orange line between points (148, 202) and (394, 4).
; PLAN: r0=148(x1), r1=202(y1), r2=394(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 202
LDI r2, 394
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
