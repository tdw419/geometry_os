; DESCRIPTION: Places a magenta line segment connecting (129, 205) to (485, 178).
; PLAN: r0=129(x1), r1=205(y1), r2=485(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 205
LDI r2, 485
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
