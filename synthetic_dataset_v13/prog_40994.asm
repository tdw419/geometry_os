; DESCRIPTION: Renders a white line between points (347, 120) and (422, 156).
; PLAN: r0=347(x1), r1=120(y1), r2=422(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 120
LDI r2, 422
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
