; DESCRIPTION: Draws a black line from (374, 77) to (422, 155).
; PLAN: r0=374(x1), r1=77(y1), r2=422(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 77
LDI r2, 422
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
