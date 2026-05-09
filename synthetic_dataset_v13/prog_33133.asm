; DESCRIPTION: Draws a white line from (485, 149) to (244, 97).
; PLAN: r0=485(x1), r1=149(y1), r2=244(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 149
LDI r2, 244
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
