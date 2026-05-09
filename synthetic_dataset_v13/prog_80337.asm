; DESCRIPTION: Renders a black line between points (409, 40) and (217, 243).
; PLAN: r0=409(x1), r1=40(y1), r2=217(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 40
LDI r2, 217
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
