; DESCRIPTION: Renders a yellow line between points (1, 79) and (229, 237).
; PLAN: r0=1(x1), r1=79(y1), r2=229(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 79
LDI r2, 229
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
