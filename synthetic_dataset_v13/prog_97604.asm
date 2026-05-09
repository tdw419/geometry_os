; DESCRIPTION: Renders a black line between points (331, 186) and (422, 39).
; PLAN: r0=331(x1), r1=186(y1), r2=422(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 186
LDI r2, 422
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
