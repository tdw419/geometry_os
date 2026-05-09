; DESCRIPTION: Renders a green line between points (485, 96) and (442, 232).
; PLAN: r0=485(x1), r1=96(y1), r2=442(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 96
LDI r2, 442
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
