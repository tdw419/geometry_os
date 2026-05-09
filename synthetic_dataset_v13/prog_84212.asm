; DESCRIPTION: Renders a cyan line between points (430, 131) and (485, 184).
; PLAN: r0=430(x1), r1=131(y1), r2=485(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 131
LDI r2, 485
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
