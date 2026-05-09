; DESCRIPTION: Draws a blue line from (485, 152) to (435, 79).
; PLAN: r0=485(x1), r1=152(y1), r2=435(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 152
LDI r2, 435
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
