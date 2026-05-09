; DESCRIPTION: Renders a black line between points (225, 82) and (5, 165).
; PLAN: r0=225(x1), r1=82(y1), r2=5(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 82
LDI r2, 5
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
