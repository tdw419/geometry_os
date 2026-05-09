; DESCRIPTION: Renders a white line between points (347, 63) and (214, 77).
; PLAN: r0=347(x1), r1=63(y1), r2=214(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 63
LDI r2, 214
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
