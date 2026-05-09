; DESCRIPTION: Renders a black line between points (373, 142) and (400, 13).
; PLAN: r0=373(x1), r1=142(y1), r2=400(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 142
LDI r2, 400
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
