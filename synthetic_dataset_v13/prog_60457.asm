; DESCRIPTION: Renders a yellow line between points (325, 116) and (219, 178).
; PLAN: r0=325(x1), r1=116(y1), r2=219(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 116
LDI r2, 219
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
