; DESCRIPTION: Renders a blue line between points (135, 229) and (485, 107).
; PLAN: r0=135(x1), r1=229(y1), r2=485(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 229
LDI r2, 485
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
