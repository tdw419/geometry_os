; DESCRIPTION: Renders a yellow line between points (324, 75) and (485, 182).
; PLAN: r0=324(x1), r1=75(y1), r2=485(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 75
LDI r2, 485
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
