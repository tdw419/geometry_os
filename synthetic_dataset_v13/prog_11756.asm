; DESCRIPTION: Renders a purple line between points (509, 254) and (485, 71).
; PLAN: r0=509(x1), r1=254(y1), r2=485(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 254
LDI r2, 485
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
