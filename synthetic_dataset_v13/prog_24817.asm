; DESCRIPTION: Renders a yellow line between points (399, 82) and (124, 76).
; PLAN: r0=399(x1), r1=82(y1), r2=124(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 82
LDI r2, 124
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
