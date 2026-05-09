; DESCRIPTION: Places a magenta line segment connecting (329, 126) to (485, 144).
; PLAN: r0=329(x1), r1=126(y1), r2=485(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 126
LDI r2, 485
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
