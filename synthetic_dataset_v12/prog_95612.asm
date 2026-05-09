; DESCRIPTION: Renders a green line between points (429, 128) and (293, 85).
; PLAN: r0=429(x1), r1=128(y1), r2=293(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 128
LDI r2, 293
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
