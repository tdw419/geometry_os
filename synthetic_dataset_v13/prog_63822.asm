; DESCRIPTION: Renders a green line between points (141, 23) and (485, 46).
; PLAN: r0=141(x1), r1=23(y1), r2=485(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 23
LDI r2, 485
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
