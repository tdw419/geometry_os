; DESCRIPTION: Renders a black line between points (291, 254) and (422, 226).
; PLAN: r0=291(x1), r1=254(y1), r2=422(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 254
LDI r2, 422
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
