; DESCRIPTION: Renders a black line between points (293, 175) and (125, 110).
; PLAN: r0=293(x1), r1=175(y1), r2=125(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 175
LDI r2, 125
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
