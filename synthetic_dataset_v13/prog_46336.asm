; DESCRIPTION: Renders a magenta line between points (485, 168) and (461, 138).
; PLAN: r0=485(x1), r1=168(y1), r2=461(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 168
LDI r2, 461
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
