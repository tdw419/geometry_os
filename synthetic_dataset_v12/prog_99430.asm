; DESCRIPTION: Renders a black line between points (184, 249) and (72, 249).
; PLAN: r0=184(x1), r1=249(y1), r2=72(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 249
LDI r2, 72
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
