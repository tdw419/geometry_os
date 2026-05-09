; DESCRIPTION: Renders a white line between points (219, 191) and (293, 72).
; PLAN: r0=219(x1), r1=191(y1), r2=293(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 191
LDI r2, 293
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
