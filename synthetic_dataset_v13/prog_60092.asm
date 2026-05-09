; DESCRIPTION: Draws a black line from (219, 189) to (506, 120).
; PLAN: r0=219(x1), r1=189(y1), r2=506(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 189
LDI r2, 506
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
