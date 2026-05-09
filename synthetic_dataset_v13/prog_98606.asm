; DESCRIPTION: Draws a green line from (485, 224) to (100, 250).
; PLAN: r0=485(x1), r1=224(y1), r2=100(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 224
LDI r2, 100
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
