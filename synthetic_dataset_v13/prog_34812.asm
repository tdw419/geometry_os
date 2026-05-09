; DESCRIPTION: Renders a purple line between points (485, 126) and (472, 43).
; PLAN: r0=485(x1), r1=126(y1), r2=472(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 126
LDI r2, 472
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
