; DESCRIPTION: Renders a black line between points (233, 245) and (293, 197).
; PLAN: r0=233(x1), r1=245(y1), r2=293(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 245
LDI r2, 293
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
