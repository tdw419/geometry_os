; DESCRIPTION: Renders a black line between points (177, 245) and (485, 26).
; PLAN: r0=177(x1), r1=245(y1), r2=485(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 245
LDI r2, 485
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
