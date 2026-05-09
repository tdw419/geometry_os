; DESCRIPTION: Renders a white line between points (474, 19) and (357, 82).
; PLAN: r0=474(x1), r1=19(y1), r2=357(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 19
LDI r2, 357
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
