; DESCRIPTION: Places a orange line segment connecting (485, 164) to (305, 235).
; PLAN: r0=485(x1), r1=164(y1), r2=305(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 164
LDI r2, 305
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
