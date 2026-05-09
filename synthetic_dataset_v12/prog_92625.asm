; DESCRIPTION: Renders a magenta line between points (171, 102) and (485, 191).
; PLAN: r0=171(x1), r1=102(y1), r2=485(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 102
LDI r2, 485
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
