; DESCRIPTION: Renders a blue line between points (485, 66) and (59, 231).
; PLAN: r0=485(x1), r1=66(y1), r2=59(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 66
LDI r2, 59
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
