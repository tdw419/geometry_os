; DESCRIPTION: Renders a magenta line between points (83, 214) and (422, 82).
; PLAN: r0=83(x1), r1=214(y1), r2=422(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 214
LDI r2, 422
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
