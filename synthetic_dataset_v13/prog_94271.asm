; DESCRIPTION: Renders a yellow line between points (293, 164) and (195, 18).
; PLAN: r0=293(x1), r1=164(y1), r2=195(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 164
LDI r2, 195
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
