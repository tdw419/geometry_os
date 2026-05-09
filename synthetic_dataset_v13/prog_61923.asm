; DESCRIPTION: Renders a black line between points (409, 151) and (205, 142).
; PLAN: r0=409(x1), r1=151(y1), r2=205(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 151
LDI r2, 205
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
