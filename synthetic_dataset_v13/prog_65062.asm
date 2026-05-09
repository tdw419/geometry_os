; DESCRIPTION: Renders a magenta line between points (388, 210) and (485, 35).
; PLAN: r0=388(x1), r1=210(y1), r2=485(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 210
LDI r2, 485
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
