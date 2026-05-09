; DESCRIPTION: Renders a black line between points (69, 23) and (134, 248).
; PLAN: r0=69(x1), r1=23(y1), r2=134(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 23
LDI r2, 134
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
