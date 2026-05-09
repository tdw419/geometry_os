; DESCRIPTION: Renders a cyan line between points (485, 91) and (358, 147).
; PLAN: r0=485(x1), r1=91(y1), r2=358(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 91
LDI r2, 358
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
