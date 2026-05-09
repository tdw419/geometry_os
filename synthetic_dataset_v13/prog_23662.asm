; DESCRIPTION: Renders a black line between points (219, 235) and (509, 103).
; PLAN: r0=219(x1), r1=235(y1), r2=509(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 235
LDI r2, 509
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
