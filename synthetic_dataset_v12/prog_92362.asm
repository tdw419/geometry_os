; DESCRIPTION: Renders a blue line between points (214, 177) and (347, 6).
; PLAN: r0=214(x1), r1=177(y1), r2=347(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 177
LDI r2, 347
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
