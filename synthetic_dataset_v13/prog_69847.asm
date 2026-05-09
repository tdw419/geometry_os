; DESCRIPTION: Renders a orange line between points (256, 40) and (429, 109).
; PLAN: r0=256(x1), r1=40(y1), r2=429(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 40
LDI r2, 429
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
