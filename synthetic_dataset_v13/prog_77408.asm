; DESCRIPTION: Renders a black line between points (254, 204) and (448, 164).
; PLAN: r0=254(x1), r1=204(y1), r2=448(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 204
LDI r2, 448
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
