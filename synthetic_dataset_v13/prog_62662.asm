; DESCRIPTION: Renders a black line between points (109, 152) and (69, 238).
; PLAN: r0=109(x1), r1=152(y1), r2=69(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 152
LDI r2, 69
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
