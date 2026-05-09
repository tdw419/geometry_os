; DESCRIPTION: Renders a orange line between points (424, 1) and (237, 237).
; PLAN: r0=424(x1), r1=1(y1), r2=237(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 1
LDI r2, 237
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
