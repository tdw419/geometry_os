; DESCRIPTION: Renders a white line between points (485, 14) and (481, 33).
; PLAN: r0=485(x1), r1=14(y1), r2=481(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 14
LDI r2, 481
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
