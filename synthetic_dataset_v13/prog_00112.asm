; DESCRIPTION: Draws a magenta line from (485, 96) to (360, 130).
; PLAN: r0=485(x1), r1=96(y1), r2=360(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 96
LDI r2, 360
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
