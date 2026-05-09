; DESCRIPTION: Renders a magenta line between points (179, 46) and (485, 1).
; PLAN: r0=179(x1), r1=46(y1), r2=485(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 46
LDI r2, 485
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
