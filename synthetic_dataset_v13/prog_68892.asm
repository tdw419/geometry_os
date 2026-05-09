; DESCRIPTION: Renders a yellow line between points (70, 144) and (485, 212).
; PLAN: r0=70(x1), r1=144(y1), r2=485(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 144
LDI r2, 485
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
