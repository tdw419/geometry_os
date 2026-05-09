; DESCRIPTION: Renders a orange line between points (30, 195) and (200, 237).
; PLAN: r0=30(x1), r1=195(y1), r2=200(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 195
LDI r2, 200
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
