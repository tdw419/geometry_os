; DESCRIPTION: Draws a magenta line from (349, 99) to (485, 13).
; PLAN: r0=349(x1), r1=99(y1), r2=485(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 99
LDI r2, 485
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
