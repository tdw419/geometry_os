; DESCRIPTION: Renders a black line between points (485, 46) and (441, 82).
; PLAN: r0=485(x1), r1=46(y1), r2=441(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 46
LDI r2, 441
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
