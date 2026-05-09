; DESCRIPTION: Renders a black line between points (256, 79) and (414, 123).
; PLAN: r0=256(x1), r1=79(y1), r2=414(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 79
LDI r2, 414
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
