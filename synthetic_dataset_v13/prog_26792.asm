; DESCRIPTION: Renders a black line between points (442, 199) and (485, 122).
; PLAN: r0=442(x1), r1=199(y1), r2=485(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 199
LDI r2, 485
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
