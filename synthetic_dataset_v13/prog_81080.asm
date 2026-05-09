; DESCRIPTION: Renders a black line between points (70, 102) and (422, 205).
; PLAN: r0=70(x1), r1=102(y1), r2=422(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 102
LDI r2, 422
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
