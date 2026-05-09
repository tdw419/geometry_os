; DESCRIPTION: Places a white line segment connecting (211, 145) to (485, 195).
; PLAN: r0=211(x1), r1=145(y1), r2=485(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 145
LDI r2, 485
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
