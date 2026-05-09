; DESCRIPTION: Renders a black line between points (402, 65) and (299, 171).
; PLAN: r0=402(x1), r1=65(y1), r2=299(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 65
LDI r2, 299
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
