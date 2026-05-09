; DESCRIPTION: Renders a cyan line between points (89, 27) and (485, 225).
; PLAN: r0=89(x1), r1=27(y1), r2=485(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 27
LDI r2, 485
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
