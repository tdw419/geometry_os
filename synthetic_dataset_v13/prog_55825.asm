; DESCRIPTION: Renders a yellow line between points (164, 90) and (347, 131).
; PLAN: r0=164(x1), r1=90(y1), r2=347(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 90
LDI r2, 347
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
