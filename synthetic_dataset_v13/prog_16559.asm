; DESCRIPTION: Renders a orange line between points (237, 90) and (287, 64).
; PLAN: r0=237(x1), r1=90(y1), r2=287(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 90
LDI r2, 287
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
