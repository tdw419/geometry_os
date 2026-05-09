; DESCRIPTION: Renders a black line between points (202, 250) and (133, 109).
; PLAN: r0=202(x1), r1=250(y1), r2=133(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 250
LDI r2, 133
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
