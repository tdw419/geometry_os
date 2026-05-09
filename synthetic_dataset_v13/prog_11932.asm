; DESCRIPTION: Renders a black line between points (104, 181) and (64, 234).
; PLAN: r0=104(x1), r1=181(y1), r2=64(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 181
LDI r2, 64
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
