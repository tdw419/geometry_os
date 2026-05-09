; DESCRIPTION: Draws a magenta line from (433, 252) to (485, 48).
; PLAN: r0=433(x1), r1=252(y1), r2=485(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 252
LDI r2, 485
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
