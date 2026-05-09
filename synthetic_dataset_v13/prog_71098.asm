; DESCRIPTION: Renders a black line between points (400, 26) and (330, 226).
; PLAN: r0=400(x1), r1=26(y1), r2=330(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 26
LDI r2, 330
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
