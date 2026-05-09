; DESCRIPTION: Renders a black line between points (165, 103) and (340, 181).
; PLAN: r0=165(x1), r1=103(y1), r2=340(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 103
LDI r2, 340
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
