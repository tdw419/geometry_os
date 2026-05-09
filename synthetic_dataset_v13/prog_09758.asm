; DESCRIPTION: Renders a green line between points (383, 211) and (293, 89).
; PLAN: r0=383(x1), r1=211(y1), r2=293(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 211
LDI r2, 293
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
