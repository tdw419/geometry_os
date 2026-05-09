; DESCRIPTION: Renders a black line between points (422, 69) and (283, 18).
; PLAN: r0=422(x1), r1=69(y1), r2=283(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 69
LDI r2, 283
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
