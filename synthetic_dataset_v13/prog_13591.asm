; DESCRIPTION: Renders a black line between points (224, 160) and (396, 87).
; PLAN: r0=224(x1), r1=160(y1), r2=396(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 160
LDI r2, 396
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
