; DESCRIPTION: Renders a black line between points (485, 139) and (91, 238).
; PLAN: r0=485(x1), r1=139(y1), r2=91(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 139
LDI r2, 91
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
