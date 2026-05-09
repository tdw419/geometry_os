; DESCRIPTION: Renders a black line between points (409, 236) and (104, 18).
; PLAN: r0=409(x1), r1=236(y1), r2=104(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 236
LDI r2, 104
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
