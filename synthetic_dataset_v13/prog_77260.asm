; DESCRIPTION: Renders a orange line between points (418, 176) and (237, 61).
; PLAN: r0=418(x1), r1=176(y1), r2=237(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 176
LDI r2, 237
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
